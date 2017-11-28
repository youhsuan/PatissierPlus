//
//  APIClient.swift
//  Patissier
//
//  Created by Roy Hsu on 24/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - APIError

enum APIError: Error {

    // MARK: Property

    case notDictionary

}

// MARK: - APIClient

import Alamofire
import Unbox

struct APIClient {

    // MARK: Property

    var sessionManager = SessionManager.default

}

// MARK: - UserAPIClient

extension APIClient: UserAPIClient {

    // MARK: Sign In With Facebook

    @discardableResult
    func signInWithFacebook(token: String, success: @escaping SignInWithFacebookSuccess, failure: SignInWithFacebookFailure?) -> URLSessionTask? {

        let endpoint = Router.signInFacebook(token: token)

        sessionManager.adapter = nil

        let request = sessionManager
            .request(endpoint)
            .validate()
            .responseJSON { response in

                switch response.result {

                case .success(let json):

                    guard
                        let json = json as? UnboxableDictionary
                        else {

                            failure?(APIError.notDictionary)

                            return

                        }

                    do {

                        let appToken: AppToken = try unbox(
                            dictionary: json,
                            atKeyPath: "data"
                        )

                        success(appToken)

                    } catch { failure?(error) }

                case .failure(let error):

                    failure?(error)

                }
            }

        return request.task

    }

    // MARK: Read Me

    @discardableResult
    func readMe(success: @escaping ReadMeSuccess, failure: ReadMeFailure?) -> URLSessionTask? {

        let endpoint = Router.readMe
        let request = sessionManager
            .request(endpoint)
            .validate()
            .responseJSON { response in

                switch response.result {

                case .success(let json):

                    guard
                        let json = json as? UnboxableDictionary
                        else {

                            failure?(APIError.notDictionary)

                            return

                        }

                    do {

                        let user: User = try unbox(
                            dictionary: json,
                            atKeyPath: "data"
                        )

                        success(user)

                    } catch { failure?(error) }

                case .failure(let error):

                    failure?(error)

                }

            }

        return request.task

    }

}

// MARK: - ProductAPIClient

extension APIClient: ProductAPIClient {

    enum IndexProductsError: Error {

        case reachEndPage

    }

    @discardableResult
    func indexProducts(page: Page<IndexProductsPageToken>, success: @escaping ProductAPIClient.IndexProductsSuccess, failure: ProductAPIClient.IndexProductsFailure?) -> URLSessionTask? {

        var paging: String?

        switch page {

        case .begin:

            break

        case .next(let pageToken):

            paging = pageToken.rawValue

        case .end:

            failure?(IndexProductsError.reachEndPage)

            return nil

        }

        let endpoint = Router.readProducts(paging: paging)

        let request = sessionManager
            .request(endpoint)
            .validate()
            .responseJSON { response in

                switch response.result {

                case .success(let json):

                    guard
                        let json = json as? UnboxableDictionary
                        else {

                            failure?(APIError.notDictionary)

                            return

                        }

                    do {

                        let products: [Product] = try unbox(
                            dictionary: json,
                            atKey: "data"
                        )

                        var pagingJSON = json["paging"] as? [String: Any]

                        var next: Page<IndexProductsPageToken> = .end

                        if let nextPageTokenString = pagingJSON?["next"] as? String {

                            let pageToken = IndexProductsPageToken(
                                rawValue: nextPageTokenString
                            )

                            next = .next(pageToken)

                        }

                        success(products, next)

                    } catch { failure?(error) }

                case .failure(let error):

                    failure?(error)

                }

            }

        return request.task

    }

}
