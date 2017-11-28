//
//  TitlePickerController.swift
//  Patissier
//
//  Created by Roy Hsu on 11/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TitlePickerControllerDelegate

public protocol RecipientTitlePickerControllerDelegate: class {

    func controller(
        _ controller: RecipientTitlePickerController,
        didSelect recipientTitle: RecipientTitle
    )

    func controllerDidDismiss(_ controller: RecipientTitlePickerController)

}

// MARK: - RecipientTitlePickerController

import XLActionController

public final class RecipientTitlePickerController: ActionController<PickerCell, Void, PickerHeaderView, Void, UICollectionReusableView, Void>, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Property

    public final let recipientTitles: [RecipientTitle] = [ .mister, .miss ]

    public final weak var recipientTitlePickerDelegate: RecipientTitlePickerControllerDelegate?

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

    fileprivate final func setUpActionController(_ controller: RecipientTitlePickerController) {

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

            headerView.cancelBarButtonItem.action = #selector(RecipientTitlePickerController.cancel)

            headerView.doneBarButtonItem.target = self

            headerView.doneBarButtonItem.action = #selector(RecipientTitlePickerController.done)

        }

        controller.headerData = ()

    }

    // MARK: UIPickerViewDataSource

    public final func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }

    public final func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    )
    -> Int { return recipientTitles.count }

    // MARK: UIPickerViewDelegate

    public final func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    )
    -> String? { return recipientTitles[row].description }

    // MARK: Action

    @objc public final func cancel(_ sender: Any) {

        dismiss { self.recipientTitlePickerDelegate?.controllerDidDismiss(self) }

    }

    @objc public final func done(_ sender: Any) {

        guard
            let selectedRow = pickerView?.selectedRow(inComponent: 0)
        else {

            dismiss { self.recipientTitlePickerDelegate?.controllerDidDismiss(self) }

            return

        }

        let selectedRecipientTitle = recipientTitles[selectedRow]

        dismiss {

            self.recipientTitlePickerDelegate?.controller(
                self,
                didSelect: selectedRecipientTitle
            )

        }

    }

}
