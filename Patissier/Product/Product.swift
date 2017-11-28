//
//  Product.swift
//  Patissier
//
//  Created by Roy Hsu on 23/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Product

public struct Product {

    // MARK: Schema

    public struct Schema {

        public static let id = "id"

        public static let name = "name"

        public static let price = "price"

    }

    // MARK: Property

    public let id: ProductID

    public let name: String

    public let price: Double

    // MARK: Init

    public init(
        id: String,
        name: String,
        price: Double
    ) {

        self.id = ProductID(id)

        self.name = name

        self.price = price

    }

}

// MARK: - Equatable

extension Product: Equatable {

    // swiftlint:disable operator_whitespace
    public static func ==(
        lhs: Product,
        rhs: Product
    )
    -> Bool {

        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.price == rhs.price

    }
    // swiftlint:enable operator_whitespace

}

// MARK: - Preview Image

public extension Product {

    public var previewImageURL: URL {

        let urlString = "http://52.198.40.72/patissier/products/\(id.rawValue)/preview.jpg"

        return URL(string: urlString)!

    }

}

// MARK: - Model

import CoreData

extension Product: Model {

    public init(_ managedObject: NSManagedObject) throws {

        guard
            let productObject = managedObject as? ProductEntity
        else {

            throw ModelError.invalidEntityType(
                type(of: managedObject).self,
                expectedType: ProductEntity.self
            )

        }

        guard
            let id = productObject.id
        else { throw ModelError.missingValueForKey(Schema.id) }

        self.id = ProductID(id)

        guard
            let name = productObject.name
        else { throw ModelError.missingValueForKey(Schema.name) }

        self.name = name

        self.price = productObject.price

    }

    public func makeManagedObject(in context: NSManagedObjectContext) throws -> NSManagedObject {

        let productObject = ProductEntity(context: context)

        productObject.id = id.rawValue

        productObject.name = name

        productObject.price = price

        return productObject

    }

}

// MARK: - Unboxable

import Unbox

extension Product: Unboxable {

    // MARK: Init

    public init(unboxer: Unboxer) throws {

        self.id = try unboxer.unbox(key: Schema.id)

        self.name = try unboxer.unbox(key: Schema.name)

        self.price = try unboxer.unbox(key: Schema.price)

    }

}

// MARK: - Item

extension Product: Item {

    public var title: String { return name }

    public static let itemType: ItemType = .product

}
