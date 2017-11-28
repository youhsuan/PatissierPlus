//
//  AppDelegateExtensionsTests.swift
//  Patissier
//
//  Created by Roy Hsu on 26/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - AppDelegateExtensionsTests

import XCTest

@testable import Patissier

class AppDelegateExtensionsTests: XCTestCase {

    // MARK: Shared App Delegate

    func testSharedAppDelegate() {

        let expectedAppDelegate = UIApplication.shared.delegate as? AppDelegate

        XCTAssertEqual(
            AppDelegate.shared,
            expectedAppDelegate
        )

    }

}
