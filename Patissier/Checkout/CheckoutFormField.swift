//
//  CheckoutFormField.swift
//  Patissier
//
//  Created by Roy Hsu on 12/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutFormField

import Foundation

enum CheckoutFormField {

    // MARK: Case

    case items(index: Int)

    case city

    case postalCode

    case address

    case firstName

    case lastName

    case recipientTitle

    case phoneNumber

    case creditCardNumber

    case creditCardExpirationDate

    case creditCardCode

    // MARK: Property

    var localizedString: String {

        switch self {

        case .items:

            return NSLocalizedString("Merchandise", comment: "")

        case .city:

            return NSLocalizedString("City", comment: "")

        case .postalCode:

            return NSLocalizedString("Postal Code", comment: "")

        case .address:

            return NSLocalizedString("Address", comment: "")

        case .firstName:

            return NSLocalizedString("First Name", comment: "")

        case .lastName:

            return NSLocalizedString("Last Name", comment: "")

        case .recipientTitle:

            return NSLocalizedString("Title of Recipient", comment: "")

        case .phoneNumber:

            return NSLocalizedString("Phone Number", comment: "")

        case .creditCardNumber:

            return NSLocalizedString("Credit Card Number", comment: "")

        case .creditCardExpirationDate:

            return NSLocalizedString("Credit Card Expiration Date", comment: "")

        case .creditCardCode:

            return NSLocalizedString("Credit Card Code", comment: "")

        }

    }

}
