//
//  User.swift
//  PatissierTests
//
//  Created by Roy Hsu on 01/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - User

internal struct User {

    // MARK: Property

    internal let id: String?

    internal let name: String?

}

// MARK: - Equatable

// swiftlint:disable operator_whitespace
extension User: Equatable {

    internal static func ==(
        lhs: User,
        rhs: User
    )
    -> Bool {

        return lhs.id == rhs.id
            && lhs.name == rhs.name

    }

}
// swiftlint:enable operator_whitespace

// MARK: - Persistentable

import CoreData
import Patissier

extension User: Persistentable {

    internal init(_ managedObject: NSManagedObject) throws {

        guard
            let userObject = managedObject as? UserEntity
        else {

            throw ModelError.invalidEntityType(
                type(of: managedObject).self,
                expectedType: UserEntity.self
            )

        }

        self.id = userObject.id

        self.name = userObject.name

    }

    internal func makeManagedObject(in context: NSManagedObjectContext) throws -> NSManagedObject {

        let userObject = UserEntity(context: context)

        userObject.id = id

        userObject.name = name

        return userObject

    }

}
