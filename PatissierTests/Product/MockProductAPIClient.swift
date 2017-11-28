//
//  MockProductAPIClient.swift
//  Patissier
//
//  Created by Roy Hsu on 06/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - MockAPIClient

import Foundation

@testable import Patissier

class MockProductAPIClient: ProductAPIClient {

    // MARK: Property

    let products: [Product]

    let next: Page<IndexProductsPageToken>

    // MARK: Init

    init(products: [Product], next: Page<IndexProductsPageToken>) {

        self.products = products

        self.next = next

    }

    // MARK: ProductAPIClient

    func indexProducts(page: Page<IndexProductsPageToken>, success: @escaping ProductAPIClient.IndexProductsSuccess, failure: ProductAPIClient.IndexProductsFailure?) -> URLSessionTask? {

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {

            success(self.products, self.next)

        }

        return nil

    }

}
