//
//  DatePickerController.swift
//  Patissier
//
//  Created by Roy Hsu on 11/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - DatePickerControllerDelegate

public protocol DatePickerControllerDelegate: class {

    func controller(
        _ controller: DatePickerController,
        didSelect date: (month: Month, year: Year)
    )

    func controllerDidDismiss(_ controller: DatePickerController)

}

// MARK: - DatePickerController

import XLActionController

public final class DatePickerController: ActionController<PickerCell, Void, PickerHeaderView, Void, UICollectionReusableView, Void>, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Property

    public final let datePickerComponents: [DatePickerComponent] = [ .month, .year ]

    public final weak var datePickerDelegate: DatePickerControllerDelegate?

    private final weak var pickerView: UIPickerView?

    private final let months: [Month] = [
        .january,
        .february,
        .march,
        .april,
        .may,
        .june,
        .july,
        .august,
        .september,
        .october,
        .november,
        .december
    ]

    private final let numberOfValidYears = 30

    private final lazy var currentYear: Int = {

        let today = Date()

        let currentYear = Calendar.current.component(
            .year,
            from: today
        )

        return currentYear

    }()

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

    fileprivate final func setUpActionController(_ controller: DatePickerController) {

        controller.cellSpec = .cellClass { _ in return PickerCell.cellHeight }

        controller.onConfigureCellForAction = { cell, _, _ in

            self.pickerView = cell.pickerView

            cell.pickerView.delegate = self

            cell.pickerView.dataSource = self

            if let monthComponent = self.datePickerComponents.index(of: .month) {

                cell.pickerView.selectRow(
                    0,
                    inComponent: monthComponent,
                    animated: false
                )

            }

            if let yearComponent = self.datePickerComponents.index(of: .year) {

                cell.pickerView.selectRow(
                    0,
                    inComponent: yearComponent,
                    animated: false
                )

            }

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

    public final func numberOfComponents(in pickerView: UIPickerView) -> Int { return datePickerComponents.count }

    public final func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    )
    -> Int {

        switch datePickerComponents[component] {

        case .year: return numberOfValidYears

        case .month: return months.count

        }

    }

    // Todo: (version: nil, priority: .low)
    // 1. add title for each component header.

    public final func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    )
    -> String? {

        let datePickerComponent = datePickerComponents[component]

        switch datePickerComponent {

        case .year:

            let year = currentYear + row

            return "\(year)"

        case .month:

            return String(
                format: "%02d",
                months[row].rawValue
            )

        }

    }

    // MARK: Action

    @objc public final func cancel(_ sender: Any) {

        dismiss { self.datePickerDelegate?.controllerDidDismiss(self) }

    }

    @objc public final func done(_ sender: Any) {

        guard
            let yearComponent = datePickerComponents.index(of: .year),
            let selectedYearRow = pickerView?.selectedRow(inComponent: yearComponent),
            let monthComponent = datePickerComponents.index(of: .month),
            let selectedMonthRow = pickerView?.selectedRow(inComponent: monthComponent)
        else {

            dismiss { self.datePickerDelegate?.controllerDidDismiss(self) }

            return

        }

        let selectedYear = currentYear + selectedYearRow

        let selectedMonth = months[selectedMonthRow]

        dismiss {

            self.datePickerDelegate?.controller(
                self,
                didSelect: (selectedMonth, selectedYear)
            )

        }

    }

}
