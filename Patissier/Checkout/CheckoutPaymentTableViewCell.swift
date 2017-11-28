//
//  CheckoutPaymentTableViewCell.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutPaymentTableViewCell

import UIKit

class CheckoutPaymentTableViewCell: UITableViewCell {

    // MARK: Property

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var numberContentView: UIView!

    @IBOutlet private weak var numberBottomBorderView: UIView!

    @IBOutlet private(set) weak var numberTextField: CheckoutTextField!

    @IBOutlet private weak var expirationMonthLabel: UILabel!

    @IBOutlet private weak var expirationMonthContentView: UIView!

    @IBOutlet private weak var expirationMonthBottomBorderView: UIView!

    @IBOutlet private weak var expirationMonthLeftBorderView: UIView!

    @IBOutlet private weak var expirationMonthRightBorderView: UIView!

    @IBOutlet private(set) weak var expirationMonthButton: UIButton!

    @IBOutlet private weak var expirationYearLabel: UILabel!

    @IBOutlet private weak var expirationYearContentView: UIView!

    @IBOutlet private weak var expirationYearBottomBorderView: UIView!

    @IBOutlet private weak var expirationYearLeftBorderView: UIView!

    @IBOutlet private weak var expirationYearRightBorderView: UIView!

    @IBOutlet private(set) weak var expirationYearButton: UIButton!

    @IBOutlet private weak var codeLabel: UILabel!

    @IBOutlet private weak var codeContentView: UIView!

    @IBOutlet private weak var codeBottomBorderView: UIView!

    @IBOutlet private(set) weak var codeTextField: CheckoutTextField!

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpNumberContentView()

        setUpNumberLabel()

        setUpNumberTextField()

        setUpExpirationMonthContentView()

        setUpExpirationMonthLabel()

        setUpExpirationMonthButton()

        setUpExpirationYearContentView()

        setUpExpirationYearLabel()

        setUpExpirationYearButton()

        setUpCodeContentView()

        setUpCodeLabel()

        setUpCodeTextField()

    }

    // MARK: Set Up

    private func setUpNumberContentView() {

        let contentView = numberContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = numberBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

    }

    private func setUpNumberLabel() {

        let label = numberLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Card Number", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpNumberTextField() {

        let textField = numberTextField!

        textField.borderStyle = .none

        textField.clearButtonMode = .whileEditing

        textField.field = .creditCardNumber

        textField.font = UIFont.systemFont(ofSize: 16.0)

        textField.keyboardType = .numberPad

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

    private func setUpExpirationMonthContentView() {

        let contentView = expirationMonthContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = expirationMonthBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

        let leftBorderView = expirationMonthLeftBorderView!

        leftBorderView.backgroundColor = borderColor

        let rightBorderView = expirationMonthRightBorderView!

        rightBorderView.backgroundColor = borderColor

    }

    private func setUpExpirationMonthLabel() {

        let label = expirationMonthLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Exp. Month", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpExpirationMonthButton() {

        let button = expirationMonthButton!

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

    private func setUpExpirationYearContentView() {

        let contentView = expirationYearContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = expirationYearBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

        let leftBorderView = expirationYearLeftBorderView!

        leftBorderView.backgroundColor = borderColor

        let rightBorderView = expirationYearRightBorderView!

        rightBorderView.backgroundColor = borderColor

    }

    private func setUpExpirationYearLabel() {

        let label = expirationYearLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Exp. Year", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpExpirationYearButton() {

        let button = expirationYearButton!

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

    private func setUpCodeContentView() {

        let contentView = codeContentView!

        contentView.backgroundColor = .white

        let borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

        let bottomBorderView = codeBottomBorderView!

        bottomBorderView.backgroundColor = borderColor

    }

    private func setUpCodeLabel() {

        let label = codeLabel!

        label.font = UIFont(name: "Georgia", size: 12.0)

        label.numberOfLines = 1

        label.text = NSLocalizedString("Code", comment: "")

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpCodeTextField() {

        let textField = codeTextField!

        textField.borderStyle = .none

        textField.clearButtonMode = .whileEditing

        textField.field = .creditCardCode

        textField.font = UIFont.systemFont(ofSize: 16.0)

        textField.keyboardType = .numberPad

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
