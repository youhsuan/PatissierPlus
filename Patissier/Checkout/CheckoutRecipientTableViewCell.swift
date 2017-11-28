//
//  CheckoutRecipientTableViewCell.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutRecipientTableViewCell

import LGButton

// swiftlint:disable type_body_length
class CheckoutRecipientTableViewCell: UITableViewCell {

    // MARK: Property

    @IBOutlet private(set) weak var buyerButton: LGButton!

    @IBOutlet private weak var firstNameLabel: UILabel!

    @IBOutlet private weak var firstNameContentView: UIView!

    @IBOutlet private weak var firstNameBottomBorderView: UIView!

    @IBOutlet private(set) weak var firstNameTextField: CheckoutTextField!

    @IBOutlet private weak var lastNameLabel: UILabel!

    @IBOutlet private weak var lastNameContentView: UIView!

    @IBOutlet private weak var lastNameBottomBorderView: UIView!

    @IBOutlet private(set) weak var lastNameTextField: CheckoutTextField!

    @IBOutlet private weak var titleLabel: UILabel!

    @IBOutlet private weak var titleContentView: UIView!

    @IBOutlet private weak var titleBottomBorderView: UIView!

    @IBOutlet private weak var titleLeftBorderView: UIView!

    @IBOutlet private weak var titleRightBorderView: UIView!

    @IBOutlet private(set) weak var titleButton: UIButton!

    @IBOutlet private weak var phoneNumberLabel: UILabel!

    @IBOutlet private weak var phoneNumberContentView: UIView!

    @IBOutlet private weak var phoneNumberBottomBorderView: UIView!

    @IBOutlet private(set) weak var phoneNumberTextField: CheckoutTextField!

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpBuyerButton()

        setUpFirstNameContentView()

        setUpFirstNameLabel()

        setUpFirstNameTextField()

        setUpLastNameContentView()

        setUpLastNameLabel()

        setUpLastNameTextField()

        setUpTitleContentView()

        setUpTitleLabel()

        setUpTitleButton()

        setUpPhoneNumberContentView()

        setUpPhoneNumberLabel()

        setUpPhoneNumberTextField()

    }

    // MARK: Set Up

    private func setUpBuyerButton() {

        let color = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

        let button = buyerButton!

        button.backgroundColor = nil

        button.bgColor = .clear

        button.leftImageColor = color

        button.leftImageSrc = #imageLiteral(resourceName: "icon-check")
            .withRenderingMode(.alwaysTemplate)

        button.leftImageWidth = 14.0

        button.rightImageHeight = 14.0

        button.spacingBottom = 0.0

        button.spacingLeading = 0.0

        button.spacingTrailing = 0.0

        button.spacingTitleIcon = 10.0

        button.spacingTop = 0.0

        button.titleColor = color

        button.titleFontName = "Georgia"

        button.titleFontSize = 14.0

        button.titleString = NSLocalizedString("Same as Buyer", comment: "")

    }

    private func setUpFirstNameContentView() {

        let contentView = firstNameContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = firstNameBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

    }

    private func setUpFirstNameLabel() {

        let label = firstNameLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("First Name", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpFirstNameTextField() {

        let textField = firstNameTextField!

        textField.borderStyle = .none

        textField.clearButtonMode = .whileEditing

        textField.field = .firstName

        textField.font = UIFont.systemFont(ofSize: 16.0)

        textField.text = nil

        textField.textAlignment = .center

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

    private func setUpLastNameContentView() {

        let contentView = lastNameContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = lastNameBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

    }

    private func setUpLastNameLabel() {

        let label = lastNameLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Last Name", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpLastNameTextField() {

        let textField = lastNameTextField!

        textField.borderStyle = .none

        textField.clearButtonMode = .whileEditing

        textField.field = .lastName

        textField.font = UIFont.systemFont(ofSize: 16.0)

        textField.text = nil

        textField.textAlignment = .center

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

    private func setUpTitleContentView() {

        let contentView = titleContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = titleBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

        let leftBorderView = titleLeftBorderView!

        leftBorderView.backgroundColor = borderColor

        let rightBorderView = titleRightBorderView!

        rightBorderView.backgroundColor = borderColor

    }

    private func setUpTitleLabel() {

        let label = titleLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Title", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpTitleButton() {

        let button = titleButton!

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

    private func setUpPhoneNumberContentView() {

        let contentView = phoneNumberContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = phoneNumberBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

    }

    private func setUpPhoneNumberLabel() {

        let label = phoneNumberLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Phone Number", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpPhoneNumberTextField() {

        let textField = phoneNumberTextField!

        textField.borderStyle = .none

        textField.clearButtonMode = .whileEditing

        textField.field = .phoneNumber

        textField.font = UIFont.systemFont(ofSize: 16.0)

        textField.keyboardType = .phonePad

        textField.text = nil

        textField.textAlignment = .center

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
// swiftlint:enable type_body_length
