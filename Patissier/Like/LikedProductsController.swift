//
//  LikeProductController.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LikedProductsControllerDelegate

public protocol LikedProductsControllerDelegate: class {

    func controller(_ controller: LikedProductsController, didFailWith error: Error)

}

// MARK: - LikeProductController

import CoreData

public final class LikedProductsController {

    // MARK: Property

    public weak final var persistenceDelegate: PersistenceDelegate?

    public weak final var delegate: LikedProductsControllerDelegate?

}

// MARK: - LikedProductsProvider

import CoreData

extension LikedProductsController: LikedProductsProvider {

    private func validatePersistence() throws -> PersistenceDelegate {

        guard
            let persistenceDelegate = persistenceDelegate
        else { throw PersistenceError.persistenceStoreNotFound }

        return persistenceDelegate

    }

    // You should save your context manually after execute this method.
    public func likeProduct(id: ProductID) throws {

        let persistenceDelegate = try validatePersistence()

        let likeProduct = LikeProduct(productId: id)

        // Todo: inject queue.
        try persistenceDelegate.performTask(in: .main) { context in

            _ = try likeProduct.makeManagedObject(in: context)

        }

    }

    // You should save your context manually after execute this method.
    public func removeLikeFromProduct(id: ProductID) throws {

        let persistenceDelegate = try validatePersistence()

        let request: NSFetchRequest<LikeProductEntity> = LikeProductEntity.fetchRequest()

        request.predicate = NSPredicate(
            format: "productId == %@",
            id.rawValue
        )

        try persistenceDelegate.performTask(in: .main) { context in

            let likeProductObjects = try context.fetch(request)

            likeProductObjects.forEach { likeProductObject in

                context.delete(likeProductObject)

            }

        }

    }

    public final func isLikedProduct(id: ProductID) -> Bool {

        do {

            let persistenceDelegate = try validatePersistence()

            // Todo: inject queue.
            let isLiked: Bool = try persistenceDelegate.performTask(in: .main) { context in

                let request: NSFetchRequest<LikeProductEntity> = LikeProductEntity.fetchRequest()

                request.predicate = NSPredicate(
                    format: "productId == %@",
                    id.rawValue
                )

                let likeProductObjects = try context.fetch(request)

                return !likeProductObjects.isEmpty

            }

            return isLiked

        } catch {

            delegate?.controller(
                self,
                didFailWith: error
            )

            return false

        }

    }

}
