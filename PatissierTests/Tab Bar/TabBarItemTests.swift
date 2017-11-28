//
//  TabBarItemTests.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TabBarItemTests

import XCTest

@testable import Patissier

class TabBarItemTests: XCTestCase {

    // MARK: Init

    func testInitWithItemType() {

        let itemTypes: [TabBarItemType] = [ .store, .profile ]

        itemTypes.forEach { itemType in

            let item = TabBarItem(itemType: itemType)

            XCTAssertEqual(
                item.itemType,
                itemType
            )

            XCTAssertEqual(
                item.title,
                itemType.title
            )

            // Todo: Find a better way to compare two images
            XCTAssertEqual(
                item.image,
                itemType.image
            )

            // Todo: Find a better way to compare two images
//            XCTAssertEqual(
//                item.selectedImage,
//                itemType.selectedImage
//            )

        }

    }

}
