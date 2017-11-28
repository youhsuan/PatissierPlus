//
//  CheckoutActionView.swift
//  Patissier
//
//  Created by Roy Hsu on 12/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutActionView

import UIKit

class CheckoutActionView: UIView, Identifiable {

    // MARK: Property

    @IBOutlet private(set) weak var totalTitleLabel: UILabel!

    @IBOutlet private(set) weak var totalAmountLabel: UILabel!

    @IBOutlet private(set) weak var actionButton: UIButton!

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpView()

        setUpTotalTitleLabel()

        setUpTotalAmountLabel()

        setUpActionButton()

    }

    // MARK: Set Up

    private func setUpView() {

        let view = self

        view.backgroundColor = UIColor(
            red: 255.0 / 255.0,
            green: 94.0 / 255.0,
            blue: 89.0 / 255.0,
            alpha: 1.0
        )

        // Todo: fix shadow not working
        view.layer.shadowColor = UIColor(
                red: 255.0 / 255.0,
                green: 174.0 / 255.0,
                blue: 171.0 / 255.0,
                alpha: 1.0
            )
            .cgColor

        view.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)

        view.layer.shadowOpacity = 0.85

        view.layer.shadowRadius = 4.0

    }

    private func setUpTotalTitleLabel() {

        let label = totalTitleLabel!

        label.font = UIFont(name: "LuxiMono", size: 12.0)

        label.text = NSLocalizedString("Total", comment: "")

        label.textColor = .white

        label.layer.shadowColor = UIColor.black.cgColor

        label.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        label.layer.shadowOpacity = 0.5

        label.layer.shadowRadius = 2.0

    }

    private func setUpTotalAmountLabel() {

        let label = totalAmountLabel!

        label.font = UIFont(name: "LuxiMono", size: 18.0)

        label.text = "$0.0"

        label.textColor = .white

        label.layer.shadowColor = UIColor.black.cgColor

        label.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        label.layer.shadowOpacity = 0.5

        label.layer.shadowRadius = 2.0

    }

    private func setUpActionButton() {

        let button = actionButton!

        button.setTitle(
            nil,
            for: .normal
        )

        button.setTitleColor(
            UIColor(
                red: 255.0 / 255.0,
                green: 94.0 / 255.0,
                blue: 89.0 / 255.0,
                alpha: 1.0
            ),
            for: .normal
        )

        button.titleLabel?.font = UIFont.systemFont(
            ofSize: 16.0,
            weight: UIFont.Weight.semibold
        )

        button.contentEdgeInsets = UIEdgeInsets(
            top: 6.0,
            left: 10.0,
            bottom: 6.0,
            right: 10.0
        )

        button.layer.cornerRadius = 2.0

        button.layer.shadowColor = UIColor.black.cgColor

        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        button.layer.shadowOpacity = 0.3

        button.layer.shadowRadius = 2.0

    }

}
