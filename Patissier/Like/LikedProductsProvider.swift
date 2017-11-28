//
//  LikedProductsProvider.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LikedProductsProvider

import Foundation

public protocol LikedProductsProvider: class {

    func isLikedProduct(id: ProductID) -> Bool

    func likeProduct(id: ProductID) throws

    func removeLikeFromProduct(id: ProductID) throws

}
