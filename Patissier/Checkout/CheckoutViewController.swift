//
//  CheckoutViewController.swift
//  Patissier
//
//  Created by Roy Hsu on 12/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutViewController

import Cartography

// swiftlint:disable type_body_length
class CheckoutViewController: UIViewController, CheckoutTableViewControllerDelegate {

    // MARK: Property

    // swiftlint:disable force_cast
    private let actionView = UIView.load(nibName: CheckoutActionView.identifier) as! CheckoutActionView
    // swiftlint:enable force_cast

    private let contentViewController: CheckoutTableViewController

    // MARK: Init

    init(
        items: [Item],
        country: Country,
        buyer: Buyer
    ) {

        self.contentViewController = CheckoutTableViewController(
            items: items,
            country: country,
            buyer: buyer
        )

        super.init(
            nibName: nil,
            bundle: nil
        )

        setUpActionView()

        setUpContent()

    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        fatalError("init(nibName:bundle:) has not been implemented")

    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

    // MARK: Set Up

    func setUpActionView() {

        view.addSubview(actionView)

        constrain(actionView) { actionView in

            let superview = actionView.superview!

            actionView.leading == superview.leading

            actionView.trailing == superview.trailing

            actionView.bottom == superview.bottom

        }

        actionView.actionButton.setTitle(
            NSLocalizedString("Purchase", comment: ""),
            for: .normal
        )

        actionView.actionButton.addTarget(
            self,
            action: #selector(checkout),
            for: .touchUpInside
        )

        // Trigger the calculation of total amount of default items.
        controler(
            contentViewController,
            didChange: contentViewController.form
        )

    }

    private func setUpContent() {

        let controller = contentViewController

        controller.delegate = self

        addChildViewController(controller)

        let contentView = controller.tableView!

        contentView.keyboardDismissMode = .onDrag

        controller.willMove(toParentViewController: self)

        view.addSubview(contentView)

        constrain(contentView, actionView) { contentView, actionView in

            let superview = contentView.superview!

            contentView.leading == superview.leading

            contentView.trailing == superview.trailing

            contentView.top == topLayoutGuideCartography

            contentView.bottom == actionView.top

        }

        controller.didMove(toParentViewController: self)

    }

    // MARK: CheckoutTableViewControllerDelegate

    func controler(
        _ controller: CheckoutTableViewController,
        didChange form: CheckoutForm
    ) {

        // Only support one product to checkout
        guard
            let itemInfo = form.itemInfos.first
            else { return }

        let totalAmount = form.itemInfos.reduce(0.0) { result, element in

            return result + (element.item.price * Double(element.quantity))

        }

        actionView.totalAmountLabel.text = "$\(Int(itemInfo.item.price)) x \(itemInfo.quantity) = $\(totalAmount)"

    }

    // MARK: Action

    // Todo: fix cyclomatic complexity issue
    // swiftlint:disable cyclomatic_complexity
    @objc func checkout(_ sender: Any) {

        do {

            let form = contentViewController.form

            let result = try form.validate()

            print(result)

            // Todo: processing checkout apis

        } catch CheckoutFormValidateError.missing(let field) {

            let handler: () -> Void = { self.activateField(field) }

            switch field {

            case .items:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please set the quantity of merchandise.", comment: ""),
                    dismiss: nil
                )

            case .city:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please choose a city for shipping.", comment: ""),
                    dismiss: handler
                )

            case .postalCode:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please choose a postal code for shipping.", comment: ""),
                    dismiss: handler
                )

            case .address:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please fill in an address for shipping.", comment: ""),
                    dismiss: handler
                )

            case .firstName:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please fill in the first name of the buyer.", comment: ""),
                    dismiss: handler
                )

            case .lastName:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please fill in the last name of the buyer.", comment: ""),
                    dismiss: handler
                )

            case .recipientTitle:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please choose the title of the recipient.", comment: ""),
                    dismiss: handler
                )

            case .phoneNumber:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please fill a phone number of the buyer.", comment: ""),
                    dismiss: handler
                )

            case .creditCardNumber:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please fill in the card number of a credit card.", comment: ""),
                    dismiss: handler
                )

            case .creditCardExpirationDate:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please choose the expiration date of the credit card.", comment: ""),
                    dismiss: handler
                )

            case .creditCardCode:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please fill in the code of the credit card.", comment: ""),
                    dismiss: handler
                )

            }

        } catch CheckoutFormValidateError.invalid(let field) {

            let handler: () -> Void = { self.activateField(field) }

            switch field {

            case .items:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please set an available quantity of merchandise.", comment: ""),
                    dismiss: nil
                )

            case .city:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Unavailable city for shipping.", comment: ""),
                    dismiss: handler
                )

            case .postalCode:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Unavailable postal code for shipping.", comment: ""),
                    dismiss: handler
                )

            case .address:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Unavailable address for shipping.", comment: ""),
                    dismiss: handler
                )

            case .firstName:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please make sure the first name is correct.", comment: ""),
                    dismiss: handler
                )

            case .lastName:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please make sure the last name is correct.", comment: ""),
                    dismiss: handler
                )

            case .recipientTitle:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Invalid recipient title.", comment: ""),
                    dismiss: handler
                )

            case .phoneNumber:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please make sure the format of the phone number is correct.", comment: ""),
                    dismiss: handler
                )

            case .creditCardNumber:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Please make sure the format of the credit card number is correct.", comment: ""),
                    dismiss: handler
                )

            case .creditCardExpirationDate:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Invalid expiration date.", comment: ""),
                    dismiss: handler
                )

            case .creditCardCode:

                showAlert(
                    title: nil,
                    message: NSLocalizedString("Invalid credit card code.", comment: ""),
                    dismiss: handler
                )

            }

        } catch {

            showAlert(
                title: nil,
                message: error.localizedDescription,
                dismiss: nil
            )

        }

    }

    func activateField(_ field: CheckoutFormField) {

        switch field {

        case .items:

            break

        case .city:

            let cell = contentViewController
                .cell(forRow: 0, at: .shipping) as? CheckoutShippingTableViewCell

            cell?.cityButton.sendActions(for: .touchUpInside)

        case .postalCode:

            let cell = contentViewController
                .cell(forRow: 0, at: .shipping) as? CheckoutShippingTableViewCell

            cell?.postalCodeButton.sendActions(for: .touchUpInside)

        case .address:

            let cell = contentViewController
                .cell(forRow: 0, at: .shipping) as? CheckoutShippingTableViewCell

            cell?.addressTextField.becomeFirstResponder()

        case .firstName:

            let cell = contentViewController
                .cell(forRow: 0, at: .recipient) as? CheckoutRecipientTableViewCell

            cell?.firstNameTextField.becomeFirstResponder()

        case .lastName:

            let cell = contentViewController
                .cell(forRow: 0, at: .recipient) as? CheckoutRecipientTableViewCell

            cell?.lastNameTextField.becomeFirstResponder()

        case .recipientTitle:

            let cell = contentViewController
                .cell(forRow: 0, at: .recipient) as? CheckoutRecipientTableViewCell

            cell?.titleButton.sendActions(for: .touchUpInside)

        case .phoneNumber:

            let cell = contentViewController
                .cell(forRow: 0, at: .recipient) as? CheckoutRecipientTableViewCell

            cell?.phoneNumberTextField.becomeFirstResponder()

        case .creditCardNumber:

            let cell = contentViewController
                .cell(forRow: 0, at: .payment) as? CheckoutPaymentTableViewCell

            cell?.numberTextField.becomeFirstResponder()

        case .creditCardExpirationDate:

            let cell = contentViewController
                .cell(forRow: 0, at: .payment) as? CheckoutPaymentTableViewCell

            cell?.expirationMonthButton.sendActions(for: .touchUpInside)

        case .creditCardCode:

            let cell = contentViewController
                .cell(forRow: 0, at: .payment) as? CheckoutPaymentTableViewCell

            cell?.codeTextField.becomeFirstResponder()

        }

    }
    // swiftlint:enable cyclomatic_complexity

    // MARK: Alert

    typealias ShowAlertDismissHandler = () -> Void

    func showAlert(title: String?, message: String?, dismiss handler: ShowAlertDismissHandler?) {

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let ok = UIAlertAction(
            title: NSLocalizedString("OK", comment: ""),
            style: .cancel,
            handler: { _ in handler?() }
        )

        alert.addAction(ok)

        present(alert, animated: true, completion: nil)

    }

}
// swiftlint:enable type_body_length
