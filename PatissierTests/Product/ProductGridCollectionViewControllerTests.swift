//
//  ProductGridCollectionViewControllerTests.swift
//  Patissier
//
//  Created by Roy Hsu on 27/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductGridCollectionViewControllerTests

import XCTest

@testable import Patissier

class ProductGridCollectionViewControllerTests: XCTestCase {

    // MARK: Property

    var controller: ProductGridCollectionViewController?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

//        do {
//
//            let client = MockProductAPIClient(
//                products: [
//                    Product(id: "product_0001", name: "Cake", price: 120.0),
//                    Product(id: "product_0002", name: "Puff", price: 80.0)
//                ],
//                next: .end
//            )
//
//            let provider = ProductProvider(
//                service: .api(client)
//            )
//
//            controller = try ProductGridCollectionViewController(
//                width: UIScreen.main.bounds.width,
//                provider: provider
//            )
//
//            controller!.loadView()
//
//            controller!.viewDidLoad()
//
//            controller!.view.layoutIfNeeded()
//
//        } catch { XCTFail("\(error)") }

    }

    override func tearDown() {

        controller = nil

        super.tearDown()
    }

    // MARK: State

    // MARK: Init

    func testInit() {

//        do {
//
//            let client = MockProductAPIClient(
//                products: [],
//                next: .end
//            )
//
//            let provider = ProductProvider(
//                service: .api(client)
//            )
//
//            controller = try ProductGridCollectionViewController(
//                width: UIScreen.main.bounds.width,
//                provider: provider
//            )
//
//            XCTAssert(controller!.provider.delegate === controller!)
//
//            XCTAssertNil(controller!.delegate)
//
//        } catch { XCTFail("\(error)") }

    }

    // MARK: UI Elements

    func testCollectionView() {

        // Todo: a better way to compare UIColors
//        XCTAssertEqual(
//            controller!.collectionView!.backgroundColor,
//            UIColor(
//                red: 250.0 / 255.0,
//                green: 250.0 / 255.0,
//                blue: 250.0 / 255.0,
//                alpha: 1.0
//            )
//        )

    }

    // MARK: Collection View Data Source

    func testDataSource() {

        let promise = expectation(
            description: "Show products on the UI"
        )

        let colletionView = controller!.collectionView!

        let delegate = SpyProductGridCollectionViewControllerDelegate(
            didChange: { _ in

                promise.fulfill()

                let expectedProducts = [
                    Product(id: "product_0001", name: "Cake", price: 120.0),
                    Product(id: "product_0002", name: "Puff", price: 80.0)
                ]

                XCTAssertEqual(
                    colletionView.numberOfSections,
                    1
                )

                XCTAssertEqual(
                    colletionView.numberOfItems(inSection: 0),
                    expectedProducts.count
                )

//                XCTAssertEqual(
//                    state,
//                    .ready(fetchedProducts: expectedProducts, next: .end)
//                )

            },
            didFail: { error in

                promise.fulfill()

                XCTFail("\(error)")

            }
        )

        controller!.delegate = delegate

//        controller!.provider!.fetch(page: .begin)

        waitForExpectations(timeout: 10.0, handler: nil)

    }

}
