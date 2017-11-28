//
//  CheckoutTableViewController.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: Component

enum CheckoutComponent {

    // MARK: Case

    case items([Item]), shipping, recipient, payment

    // MARK: Property

    var localizedString: String {

        switch self {

        case .items:

            return NSLocalizedString("Items", comment: "")

        case .shipping:

            return NSLocalizedString("Shipping", comment: "")

        case .recipient:

            return NSLocalizedString("Recipient", comment: "")

        case .payment:

            return NSLocalizedString("Payment", comment: "")

        }

    }

}

extension CheckoutComponent: Equatable {

    static func == (lhs: CheckoutComponent, rhs: CheckoutComponent) -> Bool {

        switch (lhs, rhs) {

        case (.items, .items):

            // Todo: may be to compare associated values

            return true

        case (.shipping, .shipping):

            return true

        case (.recipient, .recipient):

            return true

        case (.payment, .payment):

            return true

        default:

            return false

        }

    }

}

// MARK: - CheckoutTableViewControllerDelegate

protocol CheckoutTableViewControllerDelegate: class {

    func controler(
        _ controller: CheckoutTableViewController,
        didChange form: CheckoutForm
    )

}

// MARK: - CheckoutTableViewController

import Nuke
import PhoneNumberKit

// swiftlint:disable type_body_length
class CheckoutTableViewController: UITableViewController, UITextFieldDelegate, CityPickerControllerDelegate, PostalCodePickerControllerDelegate, RecipientTitlePickerControllerDelegate, DatePickerControllerDelegate {

    typealias Component = CheckoutComponent

    // MARK: Property

    let components: [Component]

    let country: Country

    weak var delegate: CheckoutTableViewControllerDelegate?

    var form = CheckoutForm() {

        didSet {

            delegate?.controler(self, didChange: form)

            // Todo: remove printing after development
            print(form)

        }

    }

    private let buyer: Buyer

    private var isRecipientSameAsBuyer: Bool {

        return form.firstName == buyer.firstName
            && form.lastName == buyer.lastName

    }

    // MARK: Init

    init(
        items: [Item],
        country: Country,
        buyer: Buyer
    ) {

        self.components = [ .items(items), .shipping, .recipient, .payment ]

        self.country = country

        self.form.itemInfos = items.map { item in

            let defaultQuantity = 1

            return (item, defaultQuantity)

        }

        self.form.firstName = buyer.firstName

        self.form.lastName = buyer.lastName

        self.buyer = buyer

        super.init(style: .plain)

    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

    // MARK: View Lifc Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()

    }

    // MARK: Set Up

    private func setUpTableView() {

        // Todo: better way to register cells
        let nib = UINib(
            nibName: "CheckoutItemTableViewCell",
            bundle: nil
        )

        tableView.register(
            nib,
            forCellReuseIdentifier: "CheckoutItemTableViewCell"
        )

        let nib2 = UINib(
            nibName: "CheckoutShippingTableViewCell",
            bundle: nil
        )

        tableView.register(
            nib2,
            forCellReuseIdentifier: "CheckoutShippingTableViewCell"
        )

        let nib3 = UINib(
            nibName: "CheckoutRecipientTableViewCell",
            bundle: nil
        )

        tableView.register(
            nib3,
            forCellReuseIdentifier: "CheckoutRecipientTableViewCell"
        )

        let nib4 = UINib(
            nibName: "CheckoutPaymentTableViewCell",
            bundle: nil
        )

        tableView.register(
            nib4,
            forCellReuseIdentifier: "CheckoutPaymentTableViewCell"
        )

        tableView.estimatedRowHeight = 44.0

        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.separatorStyle = .none

    }

    // MARK: UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {

        return components.count

    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        let component = components[section]

        switch component {

        case .items:

            return 0.0

        case .shipping, .recipient, .payment:

            return CheckoutSectionHeaderView.viewHeight

        }

    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let component = components[section]

        switch component {

        case .items:

            return nil

        case .shipping, .recipient, .payment:

            // swiftlint:disable force_cast
            let headerView = UIView
                .load(nibName: CheckoutSectionHeaderView.identifier) as! CheckoutSectionHeaderView
            // swiftlint:enable force_cast

            headerView.titleLabel.text = component.localizedString

            return headerView

        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let component = components[section]

        switch component {

        case .items(let items):

            return items.count

        case .shipping, .recipient, .payment:

            return 1

        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let component = components[indexPath.section]

        switch component {

        case .items:

            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CheckoutItemTableViewCell",
                for: indexPath
            ) as! CheckoutItemTableViewCell
            // swiftlint:enable force_cast

            let itemInfo = form.itemInfos[indexPath.row]

            let item = itemInfo.item

            Nuke.loadImage(
                with: item.previewImageURL,
                into: cell.previewImageView
            )

            cell.titleLabel.text = item.title

            cell.priceLabel.text = "$\(item.price)"

            cell.quantityLabel.text = "\(itemInfo.quantity)"

            cell.quantityStepper.addTarget(
                self,
                action: #selector(chooseQuantity),
                for: .valueChanged
            )

            cell.quantityStepper.minimumValue = 1.0

            cell.quantityStepper.maximumValue = 99.0

            cell.selectionStyle = .none

            return cell

        case .shipping:

            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CheckoutShippingTableViewCell",
                for: indexPath
            ) as! CheckoutShippingTableViewCell
            // swiftlint:enable force_cast

            cell.cityButton.addTarget(
                self,
                action: #selector(chooseCity),
                for: .touchUpInside
            )

            let city = form.city?.name ?? ""

            cell.cityButton.setTitle(
                city,
                for: .normal
            )

            cell.postalCodeButton.addTarget(
                self,
                action: #selector(choosePostalCode),
                for: .touchUpInside
            )

            let postalCode = form.postalCode ?? ""

            cell.postalCodeButton.setTitle(
                postalCode,
                for: .normal
            )

            cell.addressTextField.addTarget(
                self,
                action: #selector(enterText),
                for: .editingChanged
            )

            cell.selectionStyle = .none

            return cell

        case .recipient:

            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CheckoutRecipientTableViewCell",
                for: indexPath
            ) as! CheckoutRecipientTableViewCell
            // swiftlint:enable force_cast

            cell.buyerButton.addTarget(
                self,
                action: #selector(selectBuyer),
                for: .touchUpInside
            )

            checkBuyerButton(of: cell)

            cell.firstNameTextField.text = form.firstName ?? ""

            cell.firstNameTextField.addTarget(
                self,
                action: #selector(enterText),
                for: .editingChanged
            )

            cell.lastNameTextField.text = form.lastName ?? ""

            cell.lastNameTextField.addTarget(
                self,
                action: #selector(enterText),
                for: .editingChanged
            )

            cell.titleButton.addTarget(
                self,
                action: #selector(chooseRecipientTitle),
                for: .touchUpInside
            )

            let recipientTitle = form.recipientTitle?.description ?? ""

            cell.titleButton.setTitle(
                recipientTitle,
                for: .normal
            )

            cell.phoneNumberTextField.addTarget(
                self,
                action: #selector(enterText),
                for: .editingChanged
            )

            cell.selectionStyle = .none

            return cell

        case .payment:

            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CheckoutPaymentTableViewCell",
                for: indexPath
            ) as! CheckoutPaymentTableViewCell
            // swiftlint:enable force_cast

            cell.numberTextField.addTarget(
                self,
                action: #selector(enterText),
                for: .editingChanged
            )

            cell.numberTextField.delegate = self

            if let expirationDate = form.creditCardExpirationDate {

                cell.expirationMonthButton.setTitle(
                    String(
                        format: "%02d",
                        expirationDate.month.rawValue
                    ),
                    for: .normal
                )

                cell.expirationYearButton.setTitle(
                    "\(expirationDate.year)",
                    for: .normal
                )

            }
            else {

                cell.expirationYearButton.setTitle(
                    "",
                    for: .normal
                )

                cell.expirationYearButton.setTitle(
                    "",
                    for: .normal
                )

            }

            cell.expirationMonthButton.addTarget(
                self,
                action: #selector(chooseExpirationDate),
                for: .touchUpInside
            )

            cell.expirationYearButton.addTarget(
                self,
                action: #selector(chooseExpirationDate),
                for: .touchUpInside
            )

            cell.codeTextField.addTarget(
                self,
                action: #selector(enterText),
                for: .editingChanged
            )

            cell.codeTextField.delegate = self

            cell.selectionStyle = .none

            return cell

        }

    }

    func cell(forRow row: Int, at component: Component) -> UITableViewCell? {

        guard
            let section = components.index(of: component)
            else { return nil }

        return tableView.cellForRow(
            at: IndexPath(row: row, section: section)
        )

    }

    // MARK: Action

    @objc func chooseQuantity(_ sender: Any) {

        guard
            let stepper = sender as? UIStepper,
            let cell = stepper.superview?.superview as? CheckoutItemTableViewCell,
            let indexPath = tableView.indexPath(for: cell)
        else { return }

        let quantity = Quantity(stepper.value)

        let quantityRange: Range<Int> = (0..<100)

        if quantityRange.contains(quantity) {

            let component = components[indexPath.section]

            switch component {

            case .items(let items):

                let item = items[indexPath.row]

                form.itemInfos[indexPath.row] = (item, quantity)

                cell.quantityLabel.text = "\(quantity)"

            case .shipping, .recipient, .payment:  break

            }

        }
        else { fatalError("Out of quantity range.") }

    }

    @objc func chooseCity(_ sender: Any) {

        // Todo: (version: nil, priority: .low)
        // 1. restore selection while presenting picker again.

        // The tool bar actions would fail if the view is still in editing. (Ex: text fields)
        view.endEditing(true)

        let cityPickerController = CityPickerController()

        cityPickerController.country = country

        cityPickerController.cityPickerDelegate = self

        present(
            cityPickerController,
            animated: true,
            completion: nil
        )

    }

    @objc func choosePostalCode(_ sender: Any) {

        // Todo: (version: nil, priority: .low)
        // 1. restore selection while presenting picker again.

        // The tool bar actions would fail if the view is still in editing. (Ex: text fields)
        view.endEditing(true)

        guard
            let selectedCity = form.city
        else {

            let alertController = UIAlertController(
                title: nil,
                message: NSLocalizedString(
                    "Please select a city first.",
                    comment: ""
                ),
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(
                title: NSLocalizedString(
                    "OK",
                    comment: ""
                ),
                style: .default,
                handler: chooseCity
            )

            alertController.addAction(okAction)

            present(
                alertController,
                animated: true,
                completion: nil
            )

            return

        }

        let postalCodePickerController = PostalCodePickerController()

        postalCodePickerController.city = selectedCity

        postalCodePickerController.postalCodePickerDelegate = self

        present(
            postalCodePickerController,
            animated: true,
            completion: nil
        )

    }

    @objc func selectBuyer(_ sender: Any) {

        if isRecipientSameAsBuyer { return }

        form.firstName = buyer.firstName

        form.lastName = buyer.lastName

        tableView.reloadData()

    }

    @objc func chooseRecipientTitle(_ sender: Any) {

        // Todo: (version: nil, priority: .low)
        // 1. restore selection while presenting picker again.

        // The tool bar actions would fail if the view is still in editing. (Ex: text fields)
        view.endEditing(true)

        let recipientTitlePickerController = RecipientTitlePickerController()

        recipientTitlePickerController.recipientTitlePickerDelegate = self

        present(
            recipientTitlePickerController,
            animated: true,
            completion: nil
        )

    }

    @objc func chooseExpirationDate(_ sender: Any) {

        // Todo: (version: nil, priority: .low)
        // 1. restore selection while presenting picker again.

        // The tool bar actions would fail if the view is still in editing. (Ex: text fields)
        view.endEditing(true)

        let datePickerController = DatePickerController()

        datePickerController.datePickerDelegate = self

        present(
            datePickerController,
            animated: true,
            completion: nil
        )

    }

    @objc func enterText(_ sender: Any) {

        if
            let textField = sender as? CheckoutTextField,
            let text = textField.text,
            let field = textField.field {

            switch field {

            case .address:

                form.address = text

            case .firstName:

                form.firstName = text

                if
                    let section = components.index(of: .recipient),
                    let cell = tableView.cellForRow(
                        at: IndexPath(row: 0, section: section)
                    ) as? CheckoutRecipientTableViewCell {

                    checkBuyerButton(of: cell)

                }

            case .lastName:

                form.lastName = text

                if
                    let section = components.index(of: .recipient),
                    let cell = tableView.cellForRow(
                        at: IndexPath(row: 0, section: section)
                        ) as? CheckoutRecipientTableViewCell {

                    checkBuyerButton(of: cell)

                }

            case .phoneNumber:

                let phoneNumber = PartialFormatter().formatPartial(text)

                // Todo: only apply in Taiwan
                textField.text = phoneNumber.replacingOccurrences(of: " ", with: "-")

                form.phoneNumber = text

            case .creditCardNumber:

                form.creditCardNumber = text

            case .creditCardCode:

                form.creditCardCode = text

            case .items, .city, .postalCode, .recipientTitle, .creditCardExpirationDate: break

            }

            return

        }

    }

    private func checkBuyerButton(of cell: CheckoutRecipientTableViewCell) {

        cell.buyerButton.leftImageSrc = isRecipientSameAsBuyer ?
            #imageLiteral(resourceName: "icon-check-selected").withRenderingMode(.alwaysTemplate) :
            #imageLiteral(resourceName: "icon-check").withRenderingMode(.alwaysTemplate)

    }

    // MARK: UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if
            let textField = textField as? CheckoutTextField,
            let text = textField.text,
            let field = textField.field {

            switch field {

            case .creditCardNumber:

                let isDeleting = (string.count == 0)

                if !isDeleting {

                    let cardNumberLength = text.count

                    let maximumCardNumberLength = 16 + 3 // includes the number of charactor "-"

                    let newCardNumberLength = cardNumberLength + string.count - range.length

                    if newCardNumberLength > maximumCardNumberLength { return false }

                    if cardNumberLength == 4 || cardNumberLength == 9 || cardNumberLength == 14 {

                        let formattedCardNumber = text + "-"

                        textField.text = formattedCardNumber

                    }

                }

            case .creditCardCode:

                let isDeleting = (string.count == 0)

                if !isDeleting {

                    let cardCodeLength = text.count

                    let newCardCodeLength = cardCodeLength + string.count - range.length

                    let maximumCardCodeLength = 4

                    if newCardCodeLength > maximumCardCodeLength { return false }

                }

            default:

                break

            }

        }

        return true

    }

    // MARK: CityPickerControllerDelegate

    func controller(
        _ controller: CityPickerController,
        didSelect city: City
    ) {

        form.postalCode = nil

        form.city = city

        // Todo: only reload shipping section
        tableView.reloadData()

    }

    func controllerDidDismiss(_ controller: CityPickerController) { }

    // MARK: PostalCodePickerControllerDelegate

    func controller(
        _ controller: PostalCodePickerController,
        didSelect postalCode: String
    ) {

        form.postalCode = postalCode

        // Todo: only reload shipping section
        tableView.reloadData()

    }

    func controllerDidDismiss(_ controller: PostalCodePickerController) { }

    // MARK: RecipientTitlePickerControllerDelegate

    func controller(
        _ controller: RecipientTitlePickerController,
        didSelect recipientTitle: RecipientTitle
    ) {

        form.recipientTitle = recipientTitle

        // Todo: only reload recipient section
        tableView.reloadData()

    }

    func controllerDidDismiss(_ controller: RecipientTitlePickerController) { }

    // MARK: DatePickerControllerDelegate

    func controller(
        _ controller: DatePickerController,
        didSelect date: (month: Month, year: Year)
    ) {

        form.creditCardExpirationDate = date

        // Todo: only reload shipping section
        tableView.reloadData()

    }

    func controllerDidDismiss(_ controller: DatePickerController) { }

}

// swiftlint:enable type_body_length
