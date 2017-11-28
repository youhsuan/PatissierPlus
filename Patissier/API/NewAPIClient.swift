//
//  NewAPIClient.swift
//  Patissier
//
//  Created by WU CHIH WEI on 2017/11/2.
//  Copyright © 2017年 TinyWorld. All rights reserved.
//

import Foundation

public struct NewAPIClient {

    public let router: NewRouter

    public let httpClient: HTTPClient

}

extension NewAPIClient: UserAPIClient {

    @discardableResult
    func signInWithFacebook(
         token: String,
         success: @escaping SignInWithFacebookSuccess,
         failure: SignInWithFacebookFailure?
    )
    -> URLSessionTask? { return nil }

    @discardableResult
    func readMe(
         success: @escaping ReadMeSuccess,
         failure: ReadMeFailure?
    )
    -> URLSessionTask? { return nil }

}

extension NewAPIClient: ProductAPIClient {

    @discardableResult
    func indexProducts(
        page: Page<IndexProductsPageToken>,
        success: @escaping IndexProductsSuccess,
        failure: IndexProductsFailure?
    )
    -> URLSessionTask? { return nil }
}
