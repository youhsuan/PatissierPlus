//
//  APIClientTests.swift
//  Patissier
//
//  Created by Roy Hsu on 24/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - APIClientTests

import Alamofire
import KeychainAccess
import XCTest

@testable import Patissier

class APIClientTests: XCTestCase {

    // MARK: Property

    var client: APIClient?

    var keychain: Keychain?

    var manager: UserManager?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        do {

            client = APIClient()

            keychain = Keychain(
                service: "com.tinyworld.Patissier.test.AppToken"
            )

            try keychain!.set("token_0001", key: "token")

            try keychain!.set("bearer", key: "token_type")

            manager = UserManager()

            try manager!.restore(from: keychain!)

        } catch { XCTFail("\(error)") }

    }

    override func tearDown() {

        do {

            client = nil

//            OHHTTPStubs.removeAllStubs()

            try keychain!.removeAll()

            keychain = nil

            manager = nil

        } catch { XCTFail("\(error)") }

        super.tearDown()
    }

    // MARK: Sign In With Facebook

    func testSignInWithFacebook() {

//        stub(
//            condition:
//                pathMatches("/patissier/api/v1/sign_in/facebook"),
//            response: { _ in
//
//                let json: Any = [
//                    "data": [
//                        "token_type": "bearer",
//                        "token": "app_0001"
//                    ]
//                ]
//
//                return OHHTTPStubsResponse(
//                    jsonObject: json,
//                    statusCode: 200,
//                    headers: nil
//                )
//
//            }
//
//        )

        let promise = expectation(
            description: "Sign in with facebook"
        )

        client!.signInWithFacebook(
            token: "fb_0001",
            success: { appToken in

                promise.fulfill()

                XCTAssertEqual(
                    appToken.tokenType,
                    .bearer
                )

                XCTAssertEqual(
                    appToken.tokenString,
                    "app_0001"
                )

            },
            failure: { error in

                promise.fulfill()

                XCTFail("\(error)")

            }
        )

        waitForExpectations(timeout: 10.0)

    }

    // MARK: Index Products

    func testIndexProducts() {

//        stub(
//            condition:
//                pathMatches("/patissier/api/v1/products"),
//            response: { _ in
//
//                let json: Any = [
//                    "data": [
//                        [
//                            "id": "product_0001",
//                            "name": "Chocolate Cake",
//                            "price": 120.0
//                        ],
//                        [
//                            "id": "product_0002",
//                            "name": "Lemon Pie",
//                            "price": 80.0
//                        ]
//                    ],
//                    "paging": [
//                        "next": "next_page_token_0001"
//                    ]
//                ]
//
//                return OHHTTPStubsResponse(
//                    jsonObject: json,
//                    statusCode: 200,
//                    headers: nil
//                )
//
//            }
//        )

        let promise = expectation(
            description: "Indexing products"
        )

        client!.indexProducts(
            page: .begin,
            success: { products, next in

                promise.fulfill()

                XCTAssertEqual(
                    products,
                    [
                        Product(id: "product_0001", name: "Chocolate Cake", price: 120.0),
                        Product(id: "product_0002", name: "Lemon Pie", price: 80.0)
                    ]
                )

                let token = IndexProductsPageToken(
                    rawValue: "next_page_token_0001"
                )

                XCTAssertEqual(
                    next,
                    .next(token)
                )

            },
            failure: { error in

                promise.fulfill()

                XCTFail("\(error)")

            }
        )

        waitForExpectations(timeout: 10.0)

    }

}
