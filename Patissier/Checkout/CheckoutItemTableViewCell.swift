//
//  CheckoutItemTableViewCell.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutItemTableViewCell

import UIKit

class CheckoutItemTableViewCell: UITableViewCell {

    // MARK: Property

    @IBOutlet private(set) weak var previewImageView: UIImageView!

    @IBOutlet private(set) weak var titleLabel: UILabel!

    @IBOutlet private(set) weak var priceLabel: UILabel!

    @IBOutlet private(set) weak var quantityStepper: UIStepper!

    @IBOutlet private(set) weak var quantityLabel: UILabel!

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpPreviewImageView()

        setUpTitleLabel()

        setUpPriceLabel()

        setUpQuantityStepper()

        setUpQuantityLabel()

    }

    // MARK: Set Up

    private func setUpPreviewImageView() {

        previewImageView.backgroundColor = .lightGray

        previewImageView.clipsToBounds = true

        previewImageView.contentMode = .scaleAspectFill

    }

    private func setUpTitleLabel() {

        let label = titleLabel!

        label.font = UIFont(name: "Georgia", size: 14.0)

        label.numberOfLines = 2

        label.text = nil

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpPriceLabel() {

        let label = priceLabel!

        label.font = UIFont(name: "LuxiMono", size: 12.0)

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

    private func setUpQuantityStepper() {

        let stepper = quantityStepper!

        stepper.tintColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

        // Todo: stepper size

    }

    private func setUpQuantityLabel() {

        let label = quantityLabel!

        label.font = UIFont(name: "LuxiMono", size: 24.0)

        label.numberOfLines = 1

        label.text = nil

        label.textAlignment = .right

        label.textColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

}
