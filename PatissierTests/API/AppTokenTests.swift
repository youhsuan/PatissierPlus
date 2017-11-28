//
//  AppTokenTests.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - AppTokenTests

import KeychainAccess
import Unbox
import XCTest

@testable import Patissier

class AppTokenTests: XCTestCase {

    // MARK: Property

    var keychain: Keychain?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        keychain = Keychain(service: "com.tinyworld.PatissierTests.AppToken")

    }

    override func tearDown() {

        do {

            try keychain!.removeAll()

        } catch { XCTFail("\(error)") }

        keychain = nil

        super.tearDown()
    }

    // MARK: Init

    func testInit() {

        let token = AppToken(
            type: .bearer,
            tokenString: "app_0001"
        )

        XCTAssertEqual(
            token.tokenType,
            .bearer
        )

        XCTAssertEqual(
            token.tokenString,
            "app_0001"
        )

    }

    func testInitWithTokenTypeString() {

        do {

            let token = try AppToken(
                type: "bearer",
                tokenString: "app_0001"
            )

            XCTAssertEqual(
                token.tokenType,
                .bearer
            )

            XCTAssertEqual(
                token.tokenString,
                "app_0001"
            )

        } catch { XCTFail("\(error)") }

    }

    // MARK: Authorization

    func testAuthorization() {

        do {

            let token = try AppToken(
                type: "bearer",
                tokenString: "app_0001"
            )

//            XCTAssertEqual(
//                token.authorization,
//                "Bearer app_0001"
//            )

        } catch { XCTFail("\(error)") }

    }

    // MARK: Unbox

    func testUnboxWithDictionary() {

        do {

            let token: AppToken = try unbox(
                dictionary: [
                    "token_type": "bearer",
                    "token": "app_0001"
                ]
            )

            XCTAssertEqual(
                token.tokenType,
                .bearer
            )

            XCTAssertEqual(
                token.tokenString,
                "app_0001"
            )

        } catch { XCTFail("\(error)") }

    }

    // MARK: Keychain

    func testExportToKeychain() {

        do {

            let token = try AppToken(
                type: "bearer",
                tokenString: "app_0001"
            )

            try token.save(to: keychain!)

            let tokenType = try keychain!.getString("token_type")

            XCTAssertEqual(
                tokenType,
                "bearer"
            )

            let tokenString = try keychain!.getString("token")

            XCTAssertEqual(
                tokenString,
                "app_0001"
            )

        } catch { XCTFail("\(error)") }

    }

}
