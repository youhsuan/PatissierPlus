//
//  ProductProvider.swift
//  Patissier
//
//  Created by Roy Hsu on 02/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductProviderDelegate

protocol ProductProviderDelegate: class {

    func didFetch(by provider: ProductProvider)

    func didFail(with error: Error, by provider: ProductProvider)

}

// MARK: - ProductProvider

import Foundation

protocol ProductProvider: class {

    // MARK: Property

    weak var delegate: ProductProviderDelegate? { get set }

    var hasMoreProducts: Bool { get }

    var numberOfProducts: Int { get }

    // MARK: Data

    func fetch()

    func product(at indexPath: IndexPath) -> Product

}
