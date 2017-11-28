//
//  PageTests.swift
//  Patissier
//
//  Created by Roy Hsu on 08/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TestPageToken

struct TestPageToken: PageToken {

    let rawValue: String

}

// MARK: - PageTokenTests

import XCTest

@testable import Patissier

class PageTokenTokenTests: XCTestCase {

    // MARK: Init

    func testInitWithRawValue() {

        let token = TestPageToken(rawValue: "test_0001")

        XCTAssertEqual(
            token.rawValue,
            "test_0001"
        )

    }

    // MARK: Equatable

    func testUnequal() {

        XCTAssertNotEqual(
            TestPageToken(rawValue: "test_0001"),
            TestPageToken(rawValue: "test_0002")
        )

    }

    func testEqual() {

        XCTAssertEqual(
            TestPageToken(rawValue: "test_0001"),
            TestPageToken(rawValue: "test_0001")
        )

    }

}

// MARK: - PageTests

class PageTests: XCTestCase {

    // MARK: Equatable

    func testUnequal() {

        XCTAssertNotEqual(
            Page.next(TestPageToken(rawValue: "test_0001")),
            Page.next(TestPageToken(rawValue: "test_0002"))
        )

    }

    func testEqual() {

        XCTAssertEqual(
            Page.next(TestPageToken(rawValue: "test_0001")),
            Page.next(TestPageToken(rawValue: "test_0001"))
        )

    }

}
