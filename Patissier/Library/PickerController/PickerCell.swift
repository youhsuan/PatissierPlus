//
//  PickerCell.swift
//  PickerAction
//
//  Created by Roy Hsu on 10/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PickerCell

import XLActionController

public final class PickerCell: ActionCell {

    // MARK: Property

    public final let pickerView = UIPickerView()

    public static let cellHeight: CGFloat = 200.0

    // MARK: Init

    public override init(frame: CGRect) {

        super.init(frame: frame)

        setUpRootView(self)

        setUpPickerView(pickerView)

    }

    public required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        setUpRootView(self)

        setUpPickerView(pickerView)

    }

    // MARK: Life Cycle

    public final override func layoutSubviews() {

        super.layoutSubviews()

        pickerView.frame = contentView.bounds

    }

    // MARK: Set Up

    fileprivate final func setUpRootView(_ view: UIView) { view.backgroundColor = .white }

    fileprivate final func setUpPickerView(_ pickerView: UIPickerView) {

        contentView.addSubview(pickerView)

        pickerView.frame = contentView.bounds

    }

}
