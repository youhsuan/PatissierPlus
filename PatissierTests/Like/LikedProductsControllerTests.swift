//
//  LikedProductsControllerTests.swift
//  PatissierTests
//
//  Created by Roy Hsu on 01/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LikedProductsControllerTests

import CoreData
import XCTest

@testable import Patissier

internal final class LikedProductsControllerTests: XCTestCase {

    // MARK: Property

    internal final var container: NSPersistentContainer?

    // swiftlint:disable weak_delegate
    internal final var delegate: PersistenceDelegate?
    // swiftlint:enable weak_delegate

    internal final var controller: LikedProductsController?

    // MARK: Set Up

    internal final override func setUp() {
        super.setUp()

        performTest {

            let modelName = "Main"

            let container = NSPersistentContainer(name: modelName)

            self.container = container

            let description = NSPersistentStoreDescription()

            description.type = NSInMemoryStoreType

            container.persistentStoreDescriptions = [ description ]

            let delegate = PersistenceManager(
                container: container
            )

            self.delegate = delegate

            let controller = LikedProductsController()

            controller.persistenceDelegate = delegate

            self.controller = controller

        }

    }

    internal final override func tearDown() {

        controller = nil

        delegate = nil

        container = nil

        super.tearDown()
    }

    // MARK: Check If A Liked Products

    internal final func testCheckIfLikedProducts() {

        let promise = expectation(description: "Check if the controller fetches the liked products correctly.")

        // swiftlint:disable nesting
        struct StubData {

            let likedProduct: Product

            let nonLikedProduct: Product

        }
        // swiftlint:enable nesting

        let stubData = StubData(
            likedProduct: Product(
                id: UUID().uuidString,
                name: "Cake",
                price: 10.0
            ),
            nonLikedProduct: Product(
                id: UUID().uuidString,
                name: "Puff",
                price: 15.0
            )
        )

        performTest {

            let container = try unwrap(self.container)

            let likedProduct = stubData.likedProduct

            let nonLikedProduct = stubData.nonLikedProduct

            container.loadPersistentStores { _, error in

                if let error = error {

                    promise.fulfill()

                    XCTFail("\(error)")

                    return

                }

                performTest {

                    let delegate = try unwrap(self.delegate)

                    let controller = try unwrap(self.controller)

                    try delegate.performTask(in: .background) { context in

                        try likedProduct.save(in: context)

                        try nonLikedProduct.save(in: context)

                        try controller.likeProduct(id: likedProduct.id)

                        try context.save()

                    }

                    XCTAssert(
                        controller.isLikedProduct(id: likedProduct.id)
                    )

                    XCTAssertFalse(
                        controller.isLikedProduct(id: nonLikedProduct.id)
                    )

                    try delegate.performTask(in: .background) { context in

                        try controller.removeLikeFromProduct(id: likedProduct.id)

                        try context.save()

                    }

                    promise.fulfill()

                    XCTAssertFalse(
                        controller.isLikedProduct(id: likedProduct.id)
                    )

                }

            }

        }

        wait(
            for: [ promise ],
            timeout: 10.0
        )

    }

}
