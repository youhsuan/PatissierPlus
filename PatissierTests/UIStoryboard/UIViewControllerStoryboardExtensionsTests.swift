//
//  UIViewControllerStoryboardExtensionsTests.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - UIViewControllerStoryboardExtensionsTests

import UIKit
import XCTest

@testable import Patissier

// swiftlint:disable type_name
class UIViewControllerStoryboardExtensionsTests: XCTestCase {
// swiftlint:enable type_name

    // MARK: Property

    var storyboard: UIStoryboard?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        storyboard = UIStoryboard(
            name: "Test",
            bundle: Bundle(for: classForCoder)
        )

    }

    override func tearDown() {

        storyboard = nil

        super.tearDown()
    }

    func testLoadFromStoryboard() {

        let controller = UIViewController.load(
            TestViewController.self,
            from: storyboard!
        )

        XCTAssertNotNil(controller)

    }

}
