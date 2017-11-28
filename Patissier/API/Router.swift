//
//  Router.swift
//  Patissier
//
//  Created by Roy Hsu on 24/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Router

import Alamofire

// MARK: - NewRouter

public protocol NewRouter {

    // MARK: - URLRequest

    func makeRequest() throws -> URLRequest

}

enum Router {

    // MARK: Property

    case signInFacebook(token: String)

    case readMe

    case readProducts(paging: String?)

    static let baseURL = URL(string: "http://52.198.40.72/patissier/api")!

    var httpMethod: HTTPMethod {

        switch self {

        case .signInFacebook:

            return .post

        case .readProducts, .readMe:

            return .get

        }

    }

    var path: String {

        switch self {

        case .signInFacebook:

            return "v1/sign_in/facebook"

        case .readMe:

            return "v1/me"

        case .readProducts:

            return "v1/products"

        }

    }

}

// MARK: - URLRequestConvertible

extension Router: URLRequestConvertible {

    func asURLRequest() throws -> URLRequest {

        let url = Router.baseURL.appendingPathComponent(path)

        var request = URLRequest(url: url)

        request.httpMethod = httpMethod.rawValue

        switch self {

        case .signInFacebook(let token):

            let parameters = [
                "access_token": token
            ]

            return try JSONEncoding.default.encode(
                request,
                with: parameters
            )

        case .readMe:

            return try URLEncoding.default.encode(
                request,
                with: nil
            )

        case .readProducts(let paging):

            var parameters = Parameters()

            parameters["paging"] = paging

            return try URLEncoding.default.encode(
                request,
                with: parameters
            )

        }

    }

}

// MARK: - NewRouter

extension Router: NewRouter {

    func makeRequest() throws -> URLRequest {

        fatalError()
    }
}
