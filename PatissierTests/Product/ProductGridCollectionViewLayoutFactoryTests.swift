//
//  ProductGridCollectionViewLayoutFactoryTests.swift
//  Patissier
//
//  Created by Roy Hsu on 02/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductGridCollectionViewLayoutFactoryTests

import XCTest

@testable import Patissier

// swiftlint:disable type_name
class ProductGridCollectionViewLayoutFactoryTests: XCTestCase {
// swiftlint:enable type_name

    typealias Factory = ProductGridCollectionViewLayoutFactory

    typealias LayoutError = Factory.LayoutError

    // MARK: Property

    var factory: Factory?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        do {

            factory = try Factory(
                width: UIScreen.main.bounds.width
            )

        } catch { XCTFail("\(error)") }

    }

    override func tearDown() {

        factory = nil

        super.tearDown()
    }

    // MARK: Init

    func testInitWithInvalidWidth() {

        XCTAssertThrowsError(
            try Factory(width: 0.0)
        ) { error in

            if case let LayoutError.widthAtLeast(width) = error {

                XCTAssertEqual(
                    width,
                    Factory.minimumItemSize.width
                )

            } else { XCTFail("Undefined error.") }

        }

    }

    // MARK: Error

    func testErrors() {

        let width: CGFloat = 100.0

        XCTAssertEqual(
            LayoutError.widthAtLeast(width).description,
            "The width should be greater than or equal to \(width) to fit the minimum layout requirement."
        )

    }

    // MARK: Minimum Item Size

    func testMinimumItemSize() {

        XCTAssertEqual(
            Factory.minimumItemSize,
            CGSize(width: 154.0, height: 160.0)
        )

    }

    func testMinimumItemMargin() {

        XCTAssertEqual(
            Factory.itemMargin,
            20.0
        )

    }

    // MARK: Column

    func testNumberOfColumns() {

        let expectedNumberOfColumns = Int(
            factory!.width / Factory.minimumItemSize.width
        )

        XCTAssertEqual(
            factory!.numberOfColumns,
            expectedNumberOfColumns
        )

    }

    // MARK: Make Layout

    func testMakeLayout() {

        do {

            let layout = try factory!.makeLayout()

            let numberOfColumns = factory!.numberOfColumns

            let expectedTotalItemsWidth =
                layout.itemSize.width *
                CGFloat(numberOfColumns)

            let numberOfInteritemSpacing = numberOfColumns - 1

            let expectedTotalItemsInterSpacing =
                layout.minimumInteritemSpacing *
                CGFloat(numberOfInteritemSpacing)

            let expectedTotalItemsMargin =
                layout.sectionInset.left +
                layout.sectionInset.right +
                expectedTotalItemsInterSpacing

            let expectedTotalWidth = expectedTotalItemsWidth + expectedTotalItemsMargin

            XCTAssertEqual(
                factory!.width,
                expectedTotalWidth
            )

            let itemMargin = Factory.itemMargin

            XCTAssertEqual(
                layout.sectionInset,
                UIEdgeInsets(
                    top: itemMargin,
                    left: itemMargin,
                    bottom: itemMargin,
                    right: itemMargin
                )
            )

            XCTAssertEqual(
                layout.scrollDirection,
                .vertical
            )

            XCTAssertEqual(
                layout.minimumInteritemSpacing,
                itemMargin
            )

            XCTAssertEqual(
                layout.minimumLineSpacing,
                itemMargin
            )

        } catch { XCTFail("\(error)") }

    }

}
