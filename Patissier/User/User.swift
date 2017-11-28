//
//  User.swift
//  Patissier
//
//  Created by Roy Hsu on 27/08/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - User

public struct User {

    // MARK: Property

    public let id: UserID

    public let name: String

    public let firstName: String

    public let lastName: String

    // MARK: Init

    public init(
        id: String,
        name: String,
        firstName: String,
        lastName: String
    ) {

        self.id = UserID(id)

        self.name = name

        self.firstName = firstName

        self.lastName = lastName

    }

}

// MARK: - Equatable

extension User: Equatable {

    // swiftlint:disable operator_whitespace
    public static func ==(
        lhs: User,
        rhs: User
    )
    -> Bool {

        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.firstName == rhs.lastName
            && lhs.lastName == rhs.lastName

    }
    // swiftlint:enable operator_whitespace

}

// MARK: Unboxable

import Unbox

extension User: Unboxable {

    // MARK: Schema

    public struct Schema {

        public static let id = "id"

        public static let name = "name"

        public static let firstName = "first_name"

        public static let lastName = "last_name"

    }

    // MARK: Init

    public init(unboxer: Unboxer) throws {

        self.id = try unboxer.unbox(key: Schema.id)

        self.name = try unboxer.unbox(key: Schema.name)

        self.firstName = try unboxer.unbox(key: Schema.firstName)

        self.lastName = try unboxer.unbox(key: Schema.lastName)

    }

}

// MARK: - Picture Image

public extension User {

    public var pictureImageURL: URL {

        let urlString = "http://52.198.40.72/patissier/users/\(id.rawValue)/picture.jpg"

        return URL(string: urlString)!

    }

}

// MARK: - Buyer

extension User: Buyer { }
