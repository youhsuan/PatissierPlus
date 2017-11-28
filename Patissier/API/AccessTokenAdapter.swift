//
//  AccessTokenAdapter.swift
//  Patissier
//
//  Created by Roy Hsu on 24/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - AccessTokenAdapter

import Alamofire
import KeychainAccess

struct AccessTokenAdapter: RequestAdapter {

    // MARK: AccessTokenError

    enum AccessTokenError: Error {

        case notFound

    }

    // MARK: Property

    let token: AppToken

    // MARK: Init

    init(token: AppToken) {

        self.token = token

    }

    // MARK: Adaption

    // Todo: unit test
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {

        var request = urlRequest

        request.addValue(
            "Bearer \(token.tokenString)",
            forHTTPHeaderField: "Authorization"
        )

        return request

    }

}
