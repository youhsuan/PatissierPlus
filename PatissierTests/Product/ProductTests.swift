//
//  ProductTests.swift
//  Patissier
//
//  Created by Roy Hsu on 23/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

import Unbox
import XCTest

@testable import Patissier

class ProductTests: XCTestCase {

    // MARK: Init

    func testInit() {

        let product = Product(
            id: "product_0001",
            name: "Chocolate Cake",
            price: 120.0
        )

        XCTAssertEqual(
            product.id.rawValue,
            "product_0001"
        )

        XCTAssertEqual(
            product.name,
            "Chocolate Cake"
        )

        XCTAssertEqual(
            product.price,
            120.0
        )

    }

    // MARK: Image URL

    func testImageURL() {

        let product = Product(
            id: "product_0001",
            name: "Cake",
            price: 120.0
        )

        let expectedImageURL = URL(
            string: "http://52.198.40.72/patissier/products/\(product.id.rawValue)/preview.jpg"
        )!

//        XCTAssertEqual(
//            product.imageURL,
//            expectedImageURL
//        )

    }

    // MARK: Equatable

    func testUnequal() {

        XCTAssertNotEqual(
            Product(
                id: "product_0001",
                name: "Chocolate Cake",
                price: 120.0
            ),
            Product(
                id: "product_0002",
                name: "Lemon Cake",
                price: 80.0
            )
        )

    }

    func testEqual() {

        XCTAssertEqual(
            Product(
                id: "product_0001",
                name: "Chocolate Cake",
                price: 120.0
            ),
            Product(
                id: "product_0001",
                name: "Chocolate Cake",
                price: 120.0
            )
        )

    }

    // MARK: Unbox

    func testUnboxWithDictionary() {

        do {

            let product: Product = try unbox(
                dictionary: [
                    "id": "product_0001",
                    "name": "Chocolate Cake",
                    "price": 120.0
                ]
            )

            XCTAssertEqual(
                product.id.rawValue,
                "product_0001"
            )

            XCTAssertEqual(
                product.name,
                "Chocolate Cake"
            )

            XCTAssertEqual(
                product.price,
                120.0
            )

        } catch { XCTFail("\(error)") }

    }

}
