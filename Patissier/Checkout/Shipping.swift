//
//  Shipping.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ShippingError

enum ShippingError: Error {

    case cityNotFound(String)

    case invalidPostalCode(String)

    case invalidAddress(String)

}

// MARK: - Shipping

struct Shipping {

    // MARK: Property

    let city: City

    let postalCode: String

    let address: String

    // MARK: Init

    init(city: City, postalCode: String, address: String) {

        self.city = city

        self.postalCode = postalCode

        self.address = address

    }

    // Todo: remove
//    init(city cityString: String, postalCode: String, address: String) throws {
//
//        guard
//            let city = C(rawValue: cityString)
//            else {
//
//                throw ShippingError.cityNotFound(cityString)
//
//            }
//
//        self.city = city
//
//        let isValidPostalCode = city.postalCodes.contains(postalCode)
//
//        if !isValidPostalCode {
//
//            throw ShippingError.invalidPostalCode(postalCode)
//
//        }
//
//        self.postalCode = postalCode
//
//        if address.isEmpty {
//
//            throw ShippingError.invalidAddress(address)
//
//        }
//
//        self.address = address
//
//    }

}
