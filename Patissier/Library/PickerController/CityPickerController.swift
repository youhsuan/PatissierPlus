//
//  CityPickerController.swift
//  Patissier
//
//  Created by Roy Hsu on 10/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CityPickerControllerDelegate

public protocol CityPickerControllerDelegate: class {

    func controller(
        _ controller: CityPickerController,
        didSelect city: City
    )

    func controllerDidDismiss(_ controller: CityPickerController)

}

// MARK: - CityPickerController

import XLActionController

public final class CityPickerController: ActionController<PickerCell, Void, PickerHeaderView, Void, UICollectionReusableView, Void>, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Property

    public final var country: Country?

    public final weak var cityPickerDelegate: CityPickerControllerDelegate?

    private final weak var pickerView: UIPickerView?

    // MARK: Init

    public init() {

        super.init(
            nibName: nil,
            bundle: nil
        )

        setUpActionController(self)

    }

    public required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        setUpActionController(self)

    }

    // MARK: Set Up

    fileprivate final func setUpActionController(_ controller: CityPickerController) {

        controller.cellSpec = .cellClass { _ in return PickerCell.cellHeight }

        controller.onConfigureCellForAction = { cell, _, _ in

            self.pickerView = cell.pickerView

            cell.pickerView.delegate = self

            cell.pickerView.dataSource = self

            cell.pickerView.selectRow(
                0,
                inComponent: 0,
                animated: false
            )

        }

        controller.addAction(
            Action(
                (),
                style: .default,
                handler: nil
            )
        )

        controller.headerSpec = .cellClass { _ in return PickerHeaderView.headerViewHeight }

        controller.onConfigureHeader = { headerView, _ in

            headerView.cancelBarButtonItem.target = self

            headerView.cancelBarButtonItem.action = #selector(CityPickerController.cancel)

            headerView.doneBarButtonItem.target = self

            headerView.doneBarButtonItem.action = #selector(CityPickerController.done)

        }

        controller.headerData = ()

    }

    // MARK: UIPickerViewDataSource

    public final func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }

    public final func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    )
    -> Int { return country?.cities.count ?? 0 }

    // MARK: UIPickerViewDelegate

    public final func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    )
    -> String? {

        guard
            let cities = country?.cities
        else { return nil }

        return cities[row].name

    }

    // MARK: Action

    @objc public final func cancel(_ sender: Any) {

        dismiss { self.cityPickerDelegate?.controllerDidDismiss(self) }

    }

    @objc public final func done(_ sender: Any) {

        guard
            let cities = country?.cities,
            let selectedRow = pickerView?.selectedRow(inComponent: 0)
        else {

            dismiss { self.cityPickerDelegate?.controllerDidDismiss(self) }

            return

        }

        let selectedCity = cities[selectedRow]

        dismiss {

            self.cityPickerDelegate?.controller(
                self,
                didSelect: selectedCity
            )

        }

    }

}
