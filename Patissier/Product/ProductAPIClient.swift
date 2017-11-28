//
//  ProductAPIClient.swift
//  Patissier
//
//  Created by Roy Hsu on 24/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - IndexProductsPageToken

struct IndexProductsPageToken: PageToken {

    let rawValue: String

}

// MARK: - ProductAPIClient

import Foundation

protocol ProductAPIClient {

    // MARK: Index Products

    typealias IndexProductsSuccess = (_ products: [Product], _ next: Page<IndexProductsPageToken>) -> Void

    typealias IndexProductsFailure = (_ error: Error) -> Void

    @discardableResult
    func indexProducts(page: Page<IndexProductsPageToken>, success: @escaping IndexProductsSuccess, failure: IndexProductsFailure?) -> URLSessionTask?

}
