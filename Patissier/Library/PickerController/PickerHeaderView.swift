//
//  PickerHeaderView.swift
//  PickerAction
//
//  Created by Roy Hsu on 10/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PickerHeaderView

import UIKit

public final class PickerHeaderView: UICollectionReusableView {

    // MARK: Property

    public static let headerViewHeight: CGFloat = 44.0

    public final let toolBar = UIToolbar()

    public final let cancelBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .cancel,
        target: nil,
        action: nil
    )

    public final let doneBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .done,
        target: nil,
        action: nil
    )

    // MARK: Init

    public override init(frame: CGRect) {

        super.init(frame: frame)

        setUpToolBar(
            toolBar,
            on: self
        )

    }

    public required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        setUpToolBar(
            toolBar,
            on: self
        )

    }

    // MARK: Life Cycle

    public final override func layoutSubviews() {

        super.layoutSubviews()

        toolBar.frame = bounds

    }

    // MARK: Set Up

    fileprivate final func setUpToolBar(
        _ toolBar: UIToolbar,
        on view: UIView
    ) {

        view.addSubview(toolBar)

        toolBar.frame = bounds

        toolBar.items = [
            cancelBarButtonItem,
            UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: self,
                action: nil
            ),
            doneBarButtonItem
        ]

    }

}
