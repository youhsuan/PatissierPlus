//
//  CheckoutSectionHeaderView.swift
//  Patissier
//
//  Created by Roy Hsu on 12/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutSectionHeaderView

import UIKit

class CheckoutSectionHeaderView: UIView, Identifiable {

    // MARK: Property

    @IBOutlet private weak var topLeftSeparatorLineView: UIView!

    @IBOutlet private weak var bottomLeftSeparatorLineView: UIView!

    @IBOutlet private weak var topRightSeparatorLineView: UIView!

    @IBOutlet private weak var bottomRightSeparatorLineView: UIView!

    @IBOutlet private(set) weak var titleLabel: UILabel!

    static let viewHeight: CGFloat = 44.0

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpSeparatorLineViews()

        setUpTitleLabel()

    }

    // MARK: Set Up

    func setUpSeparatorLineViews() {

        let lineColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

        topLeftSeparatorLineView.backgroundColor = lineColor

        bottomLeftSeparatorLineView.backgroundColor = lineColor

        topRightSeparatorLineView.backgroundColor = lineColor

        bottomRightSeparatorLineView.backgroundColor = lineColor

    }

    func setUpTitleLabel() {

        let label = titleLabel!

        label.font = UIFont(name: "Georgia", size: 16.0)

        label.numberOfLines = 1

        label.text = nil

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

}
