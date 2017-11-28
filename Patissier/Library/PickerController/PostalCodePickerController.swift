//
//  PostalCodePickerController.swift
//  Patissier
//
//  Created by Roy Hsu on 11/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostalCodePickerControllerDelegate

public protocol PostalCodePickerControllerDelegate: class {

    func controller(
        _ controller: PostalCodePickerController,
        didSelect postalCode: String
    )

    func controllerDidDismiss(_ controller: PostalCodePickerController)

}

// MARK: - PostalCodePickerController

import XLActionController

public final class PostalCodePickerController: ActionController<PickerCell, Void, PickerHeaderView, Void, UICollectionReusableView, Void>, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Property

    public final var city: City?

    public final weak var postalCodePickerDelegate: PostalCodePickerControllerDelegate?

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

    fileprivate final func setUpActionController(_ controller: PostalCodePickerController) {

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

            headerView.cancelBarButtonItem.action = #selector(PostalCodePickerController.cancel)

            headerView.doneBarButtonItem.target = self

            headerView.doneBarButtonItem.action = #selector(PostalCodePickerController.done)

        }

        controller.headerData = ()

    }

    // MARK: UIPickerViewDataSource

    public final func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }

    public final func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
        )
    -> Int { return city?.postalCodes.count ?? 0 }

    // MARK: UIPickerViewDelegate

    public final func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    )
    -> String? {

        guard
            let postalCodes = city?.postalCodes
        else { return nil }

        return postalCodes[row]

    }

    // MARK: Action

    @objc public final func cancel(_ sender: Any) {

        dismiss { self.postalCodePickerDelegate?.controllerDidDismiss(self) }

    }

    @objc public final func done(_ sender: Any) {

        guard
            let postalCodes = city?.postalCodes,
            let selectedRow = pickerView?.selectedRow(inComponent: 0)
        else {

            dismiss { self.postalCodePickerDelegate?.controllerDidDismiss(self) }

            return

        }

        let selectedPostalCode = postalCodes[selectedRow]

        dismiss {

            self.postalCodePickerDelegate?.controller(
                self,
                didSelect: selectedPostalCode
            )

        }

    }

}
