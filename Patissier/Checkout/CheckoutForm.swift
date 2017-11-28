//
//  CheckoutForm.swift
//  Patissier
//
//  Created by Roy Hsu on 10/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutFormValidateError

enum CheckoutFormValidateError: Error {

    // MARK: Case

    case missing(field: CheckoutFormField)

    case invalid(field: CheckoutFormField)

}

// MARK: - CheckoutForm

import PhoneNumberKit

typealias Quantity = Int

struct CheckoutForm {

    // MARK: Property

    typealias ItemInfo = (item: Item, quantity: Quantity)

    var itemInfos: [ItemInfo] = []

    var city: City?

    var postalCode: String?

    var address: String?

    var firstName: String?

    var lastName: String?

    var recipientTitle: RecipientTitle?

    var phoneNumber: String?

    var creditCardNumber: String?

    var creditCardCode: String?

    var creditCardExpirationDate: (month: Month, year: Year)?

    // MARK: Validate

    typealias ValidateResult = (items: [ItemInfo], shipping: Shipping, recipient: Recipient, creditCard: CreditCard)

    func validate() throws -> ValidateResult {

        let itemInfos = try validateItemInfos()

        let shipping = try validateShipping()

        let recipient = try validateRecipient()

        let creditCard = try validatePayment()

        return (itemInfos, shipping, recipient, creditCard)

    }

    private func validateItemInfos() throws -> [ItemInfo] {

        for index in 0..<itemInfos.count {

            let itemInfo = itemInfos[index]

            let quantity = itemInfo.quantity

            if quantity == 0 {

                throw CheckoutFormValidateError.missing(
                    field: .items(index: index)
                )

            }

            if !(1..<100).contains(itemInfo.quantity) {

                throw CheckoutFormValidateError.invalid(
                    field: .items(index: index)
                )

            }

        }

        return itemInfos

    }

    private func validateShipping() throws -> Shipping {

        guard
            let city = city
            else {

                throw CheckoutFormValidateError.missing(field: .city)

            }

        guard
            let postalCode = postalCode
            else {

                throw CheckoutFormValidateError.missing(field: .postalCode)

            }

        if postalCode.isEmpty {

            throw CheckoutFormValidateError.invalid(field: .postalCode)

        }

        guard
            let address = address
            else {

                throw CheckoutFormValidateError.missing(field: .address)

            }

        if address.isEmpty {

            throw CheckoutFormValidateError.invalid(field: .address)

        }

        return Shipping(
            city: city,
            postalCode: postalCode,
            address: address
        )

    }

    private func validateRecipient() throws -> Recipient {

        guard
            let firstName = firstName
            else {

                throw CheckoutFormValidateError.missing(field: .firstName)

            }

        if firstName.isEmpty {

            throw CheckoutFormValidateError.invalid(field: .firstName)

        }

        guard
            let lastName = lastName
            else {

                throw CheckoutFormValidateError.missing(field: .lastName)

            }

        if lastName.isEmpty {

            throw CheckoutFormValidateError.invalid(field: .lastName)

        }

        guard
            let recipientTitle = recipientTitle
            else {

                throw CheckoutFormValidateError.missing(field: .recipientTitle)

            }

        guard
            let phoneNumber = phoneNumber
            else {

                throw CheckoutFormValidateError.missing(field: .phoneNumber)

            }

        guard
            (try? PhoneNumberKit().parse(phoneNumber)) != nil
            else {

                throw CheckoutFormValidateError.invalid(field: .phoneNumber)

            }

        let sanitizedPhoneNumber = phoneNumber.replacingOccurrences(of: "-", with: "")

        return Recipient(
            firstName: firstName,
            lastName: lastName,
            title: recipientTitle,
            phoneNumber: sanitizedPhoneNumber
        )

    }

    private func validatePayment() throws -> CreditCard {

        guard
            let creditCardNumber = creditCardNumber
            else {

                throw CheckoutFormValidateError.missing(field: .creditCardNumber)

            }

        if creditCardNumber.isEmpty {

            throw CheckoutFormValidateError.invalid(field: .creditCardNumber)

        }

        guard
            let creditCardExpirationDate = creditCardExpirationDate
            else {

                throw CheckoutFormValidateError.missing(field: .creditCardExpirationDate)

            }

        guard
            let creditCardCode = creditCardCode
            else {

                throw CheckoutFormValidateError.missing(field: .creditCardCode)

            }

        if creditCardNumber.isEmpty {

            throw CheckoutFormValidateError.invalid(field: .creditCardCode)

        }

        return CreditCard(
            number: creditCardNumber,
            expirationDate: creditCardExpirationDate,
            code: creditCardCode
        )

    }

}
