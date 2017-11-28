//
//  ProductAPIClientTests.swift
//  Patissier
//
//  Created by Roy Hsu on 24/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductAPIClientTests

import XCTest
@testable import Patissier

class ProductAPIClientTests: XCTestCase {

    func testIndexProducts() {

        // swiftlint:disable nesting

        struct StubData {

            let product: Product

            let paging: String

        }

        // swiftlint:enable nesting

        let product = Product(id: "123456", name: "Chocolate Cake", price: 120.0)

        let stubData = StubData(
            product: product,
            paging: "nextPage"
        )

        let stubJSON: [String: Any] = [
            "data": [
                [
                    "id": stubData.product.id,
                    "name": stubData.product.name,
                    "price": stubData.product.price
                ]
            ],
            "paging": [
                "next": stubData.paging
            ]
        ]

        let exception = XCTestExpectation(description: "Index products.")

        do {

            let data = try JSONSerialization.data(
                withJSONObject: stubJSON,
                options: .prettyPrinted
            )

            let stubHTTPClient = StubHTTPClient(
                stubHTTPResult: HTTPResult.success(data)
            )

            let productAPIClient: ProductAPIClient = NewAPIClient(
                router: Router.readProducts(paging: nil),
                httpClient: stubHTTPClient
            )

            productAPIClient.indexProducts(
                page: Page.begin,
                success: { (_, paging) in

                    exception.fulfill()

                    XCTAssertEqual(product, stubData.product)

                    XCTAssertEqual(
                        paging,
                        Page.next(IndexProductsPageToken(rawValue: stubData.paging))
                    )
                },
                failure: { error in

                    exception.fulfill()

                    XCTFail("\(error)")

                }
            )

        } catch {

            exception.fulfill()

            XCTFail("\(error)")
        }

        wait(
            for: [ exception ],
            timeout: 10.0
        )

    }

    func testFailToIndexProducts() {

        let stubHTTPClient = StubHTTPClient(
            stubHTTPResult: HTTPResult.failure(StubHTTPError.stubError)
        )

        let productAPIClient: ProductAPIClient = NewAPIClient(
            router: Router.readProducts(paging: nil),
            httpClient: stubHTTPClient
        )

        let exception = XCTestExpectation(description: "Fail to index products.")

        productAPIClient.indexProducts(
            page: Page.begin,
            success: { (_, _) in

                exception.fulfill()

                XCTFail("Success handler should not be excuted in fail to index products.")

            },
            failure: { error in

                exception.fulfill()

                guard
                    let error = error as? StubHTTPError
                else {

                    XCTFail("Error should be StubHTTPError in fail to index products.")

                    return

                }

                XCTAssertEqual(error, StubHTTPError.stubError)
            }
        )

        wait(
            for: [ exception ],
            timeout: 10.0
        )

    }

}
