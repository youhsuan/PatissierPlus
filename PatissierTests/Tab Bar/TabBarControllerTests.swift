//
//  TabBarControllerTests.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TabBarControllerTests

import XCTest

@testable import Patissier

class TabBarControllerTests: XCTestCase {

    // MARK: Property

    var controller: TabBarController?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        controller = TabBarController(
            itemTypes: [ .store, .profile ]
        )

        controller!.loadView()

        controller!.viewDidLoad()

        controller!.view.layoutIfNeeded()

    }

    override func tearDown() {

        controller = nil

        super.tearDown()
    }

    // MARK: Init

    func testInitWithItemTypes() {

        let items = controller!.tabBar.items as? [TabBarItem]

        XCTAssertNotNil(items)

        XCTAssertEqual(
            items!.count,
            2
        )

        let firstItem = items![0]

        XCTAssertEqual(
            firstItem.itemType,
            .store
        )

        let secondItem = items![1]

        XCTAssertEqual(
            secondItem.itemType,
            .profile
        )

    }

    // MARK: Tab Bar

    func testTabBar() {

        let tabBar = controller!.tabBar

        XCTAssertEqual(
            tabBar.barStyle,
            .default
        )

        XCTAssertEqual(
            tabBar.isTranslucent,
            false
        )

        // Todo: compare UIColors
        XCTAssertEqual(
            tabBar.tintColor,
            UIColor(
                red: 53.0 / 255.0,
                green: 184.0 / 255.0,
                blue: 208 / 255.0,
                alpha: 1.0
            )
        )

    }

    // MARK: Prepare Item Type

    func testPrepareViewControllerForItemType() {

        let storeNavigationController = TabBarController
            .prepare(for: .store) as? GradientNavigationController

        XCTAssertNotNil(storeNavigationController)

        let storeItem = storeNavigationController!.tabBarItem as? TabBarItem

        XCTAssertNotNil(storeItem)

        XCTAssertEqual(
            storeItem!.itemType,
            .store
        )

        let profileNavigationController = TabBarController
            .prepare(for: .profile) as? GradientNavigationController

        XCTAssertNotNil(profileNavigationController)

        let profileItem = profileNavigationController!.tabBarItem as? TabBarItem

        XCTAssertNotNil(profileItem)

        XCTAssertEqual(
            profileItem!.itemType,
            .profile
        )

    }

}
