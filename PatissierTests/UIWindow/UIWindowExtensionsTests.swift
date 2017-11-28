//
//  UIWindowExtensionsTests.swift
//  Patissier
//
//  Created by Roy Hsu on 26/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - UIWindowExtensionsTests

import XCTest

@testable import Patissier

class UIWindowExtensionsTests: XCTestCase {

    // MARK: Property

    var window: UIWindow?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        window = UIWindow()

    }

    override func tearDown() {

        window = nil

        super.tearDown()
    }

    // MARK: Update Root View Controller

    func testUpdateRootViewController() {

        let promise = expectation(
            description: "Update root view controller with another view controller"
        )

        let newViewController = UIViewController()

        window!.updateRoot(
            to: newViewController,
            animation: { _, _, completion in

                completion?(true)

            },
            completion: { _ in

                promise.fulfill()

            }
        )

        waitForExpectations(timeout: 10.0) { error in

            if let error = error {

                XCTFail("\(error)")

            }

        }

    }

}
