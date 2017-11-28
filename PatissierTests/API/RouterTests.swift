//
//  RouterTests.swift
//  Patissier
//
//  Created by Roy Hsu on 24/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - RouterTests

import XCTest

@testable import Patissier

class RouterTests: XCTestCase {

    // MARK: Property

    let baseURLString = "http://52.198.40.72/patissier/api"

    // MARK: Base URL

    func testBaseURL() {

        XCTAssertEqual(
            Router.baseURL.absoluteString,
            baseURLString
        )

    }

    // MARK: Sign In

    func testRouteSignInFacebook() {

        do {

            let signInFacebook = Router.signInFacebook(token: "fb_0001")

            let request = try signInFacebook.asURLRequest()

            let expectedURL = URL(string: "\(baseURLString)/v1/sign_in/facebook")!

            var expectedRequest = URLRequest(url: expectedURL)

            expectedRequest.httpMethod = "POST"

            expectedRequest.addValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )

            let expectedJSON: Any = [
                "access_token": "fb_0001"
            ]

            expectedRequest.httpBody = try JSONSerialization.data(
                withJSONObject: expectedJSON
            )

            XCTAssertEqual(
                request,
                expectedRequest
            )

        } catch { XCTFail("\(error)") }

    }

    // MARK: Products

    func testRouteReadProducts() {

        do {

            let readProducts = Router.readProducts(paging: "page_0001")

            let request = try readProducts.asURLRequest()

            let expectedURL = URL(string: "\(baseURLString)/v1/products?paging=page_0001")!

            var expectedRequest = URLRequest(url: expectedURL)

            expectedRequest.httpMethod = "GET"

            XCTAssertEqual(
                request,
                expectedRequest
            )

        } catch { XCTFail("\(error)") }

    }

}
