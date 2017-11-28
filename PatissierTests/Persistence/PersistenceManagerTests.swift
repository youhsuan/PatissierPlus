//
//  PersistenceManagerTests.swift
//  PatissierTests
//
//  Created by Roy Hsu on 31/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PersistenceManagerTests

import CoreData
import XCTest

@testable import Patissier

internal final class PersistenceManagerTests: XCTestCase {

    // MARK: Property

    internal final var container: NSPersistentContainer?

    // swiftlint:disable weak_delegate
    internal final var delegate: PersistenceDelegate?
    // swiftlint:enable weak_delegate

    // MARK: Set Up

    internal final override func setUp() {
        super.setUp()

        performTest {

            let bundle = Bundle(
                for: type(of: self)
            )

            let modelName = "Test"

            let model = try unwrap(
                NSManagedObjectModel.mergedModel(
                    from: [ bundle ]
                )
            )

            let container = NSPersistentContainer(
                name: modelName,
                managedObjectModel: model
            )

            self.container = container

            let description = NSPersistentStoreDescription()

            description.type = NSInMemoryStoreType

            container.persistentStoreDescriptions = [ description ]

            let delegate = PersistenceManager(
                container: container
            )

            self.delegate = delegate

        }

    }

    internal final override func tearDown() {

        delegate = nil

        container = nil

        super.tearDown()
    }

    // MARK: Save

    internal final func testPerformTask() {

        let promise = expectation(description: "Perform task.")

        // swiftlint:disable nesting
        struct StubData {

            let user: User

        }
        // swiftlint:enable nesting

        let stubData = StubData(
            user: User(
                id: UUID().uuidString,
                name: "John Appleseed"
            )
        )

        performTest {

            let container = try unwrap(self.container)

            container.loadPersistentStores { _, error in

                if let error = error {

                    promise.fulfill()

                    XCTFail("\(error)")

                    return

                }

                performTest {

                    let delegate = try unwrap(self.delegate)

                    try delegate.performTask(in: .background) { context in

                        try stubData.user.save(in: context)

                    }

                    let userObjects: [UserEntity] = try delegate.performTask(in: .main) { context in

                        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()

                        return try context.fetch(request)

                    }

                    promise.fulfill()

                    XCTAssertEqual(
                        userObjects.count,
                        1
                    )

                    let userObject = try unwrap(userObjects.first)

                    XCTAssertEqual(
                        try User(userObject),
                        stubData.user
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
