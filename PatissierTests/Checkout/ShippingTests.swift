//
//  ShippingTests.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ShippingTests

import XCTest

@testable import Patissier

class ShippingTests: XCTestCase {

    // MARK: Init

    func testInitWithNoexistentCity() {

        XCTAssertThrowsError(
            try Shipping<TaiwanCity>(
                city: "Noexistent City",
                postalCode: "110",
                address: "No.7, Sec. 5, Xinyi Rd., Xinyi Dist."
            )
        ) { error in

            if case ShippingError.cityNotFound(let city) = error {

                XCTAssertEqual(
                    city,
                    "Noexistent City"
                )

            } else { XCTFail("Undefined error.") }

        }

    }

    func testInitWithInvalidPostalCode() {

        XCTAssertThrowsError(
            try Shipping<TaiwanCity>(
                city: "Taipei",
                postalCode: "000",
                address: "No.7, Sec. 5, Xinyi Rd., Xinyi Dist."
            )
        ) { error in

            if case ShippingError.invalidPostalCode(let code) = error {

                XCTAssertEqual(
                    code,
                    "000"
                )

            } else { XCTFail("Undefined error.") }

        }

    }

    func testInitWithInvalidAddress() {

        XCTAssertThrowsError(
            try Shipping<TaiwanCity>(
                city: "Taipei",
                postalCode: "110",
                address: ""
            )
        ) { error in

            if case ShippingError.invalidAddress(let address) = error {

                XCTAssertEqual(
                    address,
                    ""
                )

            } else { XCTFail("Undefined error.") }

        }

    }

    func testInit() {

        do {

            let shipping = try Shipping<TaiwanCity>(
                city: "Taipei",
                postalCode: "110",
                address: "No.7, Sec. 5, Xinyi Rd., Xinyi Dist."
            )

//            XCTAssertEqual(
//                shipping.city,
//                .taipei
//            )

            XCTAssertEqual(
                shipping.postalCode,
                "110"
            )

            XCTAssertEqual(
                shipping.address,
                "No.7, Sec. 5, Xinyi Rd., Xinyi Dist."
            )

        } catch { XCTFail("\(error)") }

    }

}
