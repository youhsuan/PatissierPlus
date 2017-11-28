//
//  ProductAPIProvider.swift
//  Patissier
//
//  Created by Roy Hsu on 27/08/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductAPIProvider

import Foundation

class ProductAPIProvider: ProductProvider {

    // MARK: Property

    weak var delegate: ProductProviderDelegate?

    let client: ProductAPIClient

    private var products: [Product] = []

    private var page: Page<IndexProductsPageToken> = .begin

    // MARK: Init

    init(client: ProductAPIClient) {

        self.client = client

    }

    // MARK: ProductProvider

    func fetch() {

        let previousPage = page

        client.indexProducts(
            page: page,
            success: { products, next in

                switch previousPage {

                case .begin:

                    self.products = products

                case .next, .end:

                    self.products += products

                }

                self.page = next

                self.delegate?.didFetch(by: self)

            },
            failure: { error in

                self.delegate?.didFail(with: error, by: self)

            }
        )

    }

    var hasMoreProducts: Bool {

        if page == .end { return false }

        return true

    }

    var numberOfProducts: Int {

        return products.count

    }

    func product(at indexPath: IndexPath) -> Product {

        return products[indexPath.row]

    }

}
