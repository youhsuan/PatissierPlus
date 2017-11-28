//
//  SpyProductAPIClientDelegate.swift
//  Patissier
//
//  Created by Roy Hsu on 06/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - SpyProductProviderDelegate

import XCTest

@testable import Patissier

class SpyProductProviderDelegate: ProductProviderDelegate {

    typealias DidFetch = (_ products: [Product], _ next: Page<IndexProductsPageToken>) -> Void

    typealias DidFail = (_ error: Error) -> Void

    // MARK: Property

    let didFetch: DidFetch

    let didFail: DidFail

    // MARK: Init

    init(didFetch: @escaping DidFetch, didFail: @escaping DidFail) {

        self.didFetch = didFetch

        self.didFail = didFail

    }

    // MARK: ProductProviderDelegate

    func didFetch(by provider: ProductProvider) {
        fatalError()
    }

    func didFail(with error: Error, by provider: ProductProvider) {
        fatalError()
    }

    func provider(_ provider: ProductProvider, didFetch products: [Product], next: Page<IndexProductsPageToken>) {

        didFetch(products, next)

    }

    func provider(_ provider: ProductProvider, didFailWith error: Error) {

        didFail(error)

    }

}
