//
//  LikeProduct.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LikeProduct

public struct LikeProduct {

    // MARK: Schema

    public struct Schema {

        public static let productId = "productId"

    }

    // MARK: Property

    public let productId: ProductID

    // MARK: Init

    // Todo: validate if product exists.
    public init(productId: ProductID) {

        self.productId = productId

    }

}

// MARK: - Model

import CoreData

extension LikeProduct: Model {

    public init(_ managedObject: NSManagedObject) throws {

        guard
            let likeProductObject = managedObject as? LikeProductEntity
        else {

            throw ModelError.invalidEntityType(
                type(of: managedObject).self,
                expectedType: LikeProductEntity.self
            )

        }

        guard
            let productIdValue = likeProductObject.productId
        else { throw ModelError.missingValueForKey(Schema.productId) }

        self.productId = ProductID(productIdValue)

    }

    public func makeManagedObject(in context: NSManagedObjectContext) throws -> NSManagedObject {

        let likeProduct = LikeProductEntity(context: context)

        likeProduct.productId = productId.rawValue

        return likeProduct

    }

}
