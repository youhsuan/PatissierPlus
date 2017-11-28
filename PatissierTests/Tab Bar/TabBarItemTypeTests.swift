//
//  TabBarItemTypeTests.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TabBarItemTypeTests

import XCTest

@testable import Patissier

class TabBarItemTypeTests: XCTestCase {

    // MARK: Title

    func testTitle() {

        XCTAssertEqual(
            TabBarItemType.store.title,
            NSLocalizedString("Store", comment: "")
        )

        XCTAssertEqual(
            TabBarItemType.profile.title,
            NSLocalizedString("Profile", comment: "")
        )

    }

    // MARK: Image

    func testImage() {

        // Todo: Find a better way to compare two images

        XCTAssertEqual(
            TabBarItemType.store.image,
            UIImage(named: "icon-store")!.withRenderingMode(.alwaysTemplate)
        )

        XCTAssertNil(TabBarItemType.store.selectedImage)

        XCTAssertEqual(
            TabBarItemType.profile.image,
            UIImage(named: "icon-profile")!.withRenderingMode(.alwaysTemplate)
        )

        XCTAssertEqual(
            TabBarItemType.profile.selectedImage,
            UIImage(named: "icon-profile-selected")!.withRenderingMode(.alwaysTemplate)
        )

    }

}
