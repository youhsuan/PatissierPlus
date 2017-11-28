//
//  ProductProviderTests.swift
//  Patissier
//
//  Created by Roy Hsu on 04/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductProviderTests

import XCTest

@testable import Patissier

class ProductProviderTests: XCTestCase {

    // MARK: API Service

    func testFetchProducts() {

//        let promise = expectation(
//            description: "Fetch products"
//        )
//
//        let client = MockProductAPIClient(
//            products: [
//                Product(id: "product_0001", name: "Cake", price: 120.0),
//                Product(id: "product_0002", name: "Puff", price: 80.0)
//            ],
//            next: .end
//        )
//
//        let provider = ProductProvider(
//            service: .api(client)
//        )
//
//        let delegate = SpyProductProviderDelegate(
//            didFetch: { products, next in
//
//                promise.fulfill()
//
//                XCTAssertEqual(
//                    products,
//                    [
//                        Product(id: "product_0001", name: "Cake", price: 120.0),
//                        Product(id: "product_0002", name: "Puff", price: 80.0)
//                    ]
//                )
//
//                XCTAssertEqual(
//                    next,
//                    .end
//                )
//
//            },
//            didFail: { error in
//
//                promise.fulfill()
//
//                XCTFail("\(error)")
//
//            }
//        )
//
//        provider.delegate = delegate
//
//        provider.fetch(page: .begin)
//
//        waitForExpectations(timeout: 10.0, handler: nil)

    }

}
