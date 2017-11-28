//
//  CheckoutShippingTableViewCell.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutShippingTableViewCell

import UIKit

class CheckoutShippingTableViewCell: UITableViewCell {

    // MARK: Property

    @IBOutlet private weak var cityLabel: UILabel!

    @IBOutlet private weak var cityContentView: UIView!

    @IBOutlet private weak var cityBottomBorderView: UIView!

    @IBOutlet private weak var cityLeftBorderView: UIView!

    @IBOutlet private weak var cityRightBorderView: UIView!

    @IBOutlet private(set) weak var cityButton: UIButton!

    @IBOutlet private weak var postalCodeLabel: UILabel!

    @IBOutlet private weak var postalCodeContentView: UIView!

    @IBOutlet private weak var postalCodeBottomBorderView: UIView!

    @IBOutlet private weak var postalCodeLeftBorderView: UIView!

    @IBOutlet private weak var postalCodeRightBorderView: UIView!

    @IBOutlet private(set) weak var postalCodeButton: UIButton!

    @IBOutlet private weak var addressLabel: UILabel!

    @IBOutlet private weak var addressContentView: UIView!

    @IBOutlet weak var addressBottomBorderView: UIView!

    @IBOutlet private(set) weak var addressTextField: CheckoutTextField!

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpCityContentView()

        setUpCityLabel()

        setUpCityButton()

        setUpPostalCodeContentView()

        setUpPostalCodeLabel()

        setUpPostalCodeButton()

        setUpAddressContentView()

        setUpAddressLabel()

        setUpAddressTextField()

    }

    // MARK: Set Up

    private func setUpCityContentView() {

        let contentView = cityContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = cityBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

        let leftBorderView = cityLeftBorderView!

        leftBorderView.backgroundColor = borderColor

        let rightBorderView = cityRightBorderView!

        rightBorderView.backgroundColor = borderColor

    }

    private func setUpCityLabel() {

        let label = cityLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("City", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpCityButton() {

        let button = cityButton!

        button.contentEdgeInsets = UIEdgeInsets(
            top: 10.0,
            left: 5.0,
            bottom: 5.0,
            right: 5.0
        )

        button.setTitle(nil, for: .normal)

        button.titleLabel?.textAlignment = .center

        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)

        button.tintColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpPostalCodeContentView() {

        let contentView = postalCodeContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = postalCodeBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

        let leftBorderView = postalCodeLeftBorderView!

        leftBorderView.backgroundColor = borderColor

        let rightBorderView = postalCodeRightBorderView!

        rightBorderView.backgroundColor = borderColor

    }

    private func setUpPostalCodeLabel() {

        let label = postalCodeLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Postal Code", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpPostalCodeButton() {

        let button = postalCodeButton!

        button.contentEdgeInsets = UIEdgeInsets(
            top: 10.0,
            left: 5.0,
            bottom: 5.0,
            right: 5.0
        )

        button.setTitle(nil, for: .normal)

        button.titleLabel?.textAlignment = .center

        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)

        button.tintColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpAddressContentView() {

        let contentView = addressContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = addressBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

    }

    private func setUpAddressLabel() {

        let label = addressLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Address", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpAddressTextField() {

        let textField = addressTextField!

        textField.borderStyle = .none

        textField.clearButtonMode = .whileEditing

        textField.field = .address

        textField.font = UIFont.systemFont(ofSize: 16.0)

        textField.text = nil

        textField.textAlignment = .left

        textField.textColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

        textField.tintColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

}
