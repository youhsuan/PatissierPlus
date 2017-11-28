//
//  UserManagerTests.swift
//  Patissier
//
//  Created by Roy Hsu on 08/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: UserManagerTests

import KeychainAccess
import XCTest

@testable import Patissier

class UserManagerTests: XCTestCase {

    // MARK: Property

    var manager: UserManager?

    var keychain: Keychain?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        manager = UserManager()

        keychain = Keychain(
            service: "com.tinyworld.Patissier.test.AppToken"
        )

        do {

            try keychain!.set("token_0001", key: "token")

            try keychain!.set("bearer", key: "token_type")

        } catch { XCTFail("\(error)") }

    }

    override func tearDown() {

        do {

            manager = nil

            try keychain!.removeAll()

            keychain = nil

        } catch { XCTFail("\(error)") }

        super.tearDown()
    }

    // MARK: Restore

    func testRestore() {

        do {

            XCTAssertNil(manager!.appToken)

            XCTAssertFalse(manager!.hasSignedIn)

            try manager!.restore(from: keychain!)

            XCTAssertNotNil(manager!.appToken)

            XCTAssert(manager!.hasSignedIn)

            XCTAssertEqual(
                manager!.appToken!.tokenType.rawValue,
                "bearer"
            )

            XCTAssertEqual(
                manager!.appToken!.tokenString,
                "token_0001"
            )

        } catch { XCTFail("\(error)") }

    }

}
