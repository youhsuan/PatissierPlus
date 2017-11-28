//
//  UserAPIClient.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - UserAPIClient

import Foundation

protocol UserAPIClient {

    // MARK: Sign In With Facebook

    typealias SignInWithFacebookSuccess = (AppToken) -> Void

    typealias SignInWithFacebookFailure = (Error) -> Void

    @discardableResult
    func signInWithFacebook(token: String, success: @escaping SignInWithFacebookSuccess, failure: SignInWithFacebookFailure?) -> URLSessionTask?

    // MARK: Read Me

    typealias ReadMeSuccess = (User) -> Void

    typealias ReadMeFailure = (Error) -> Void

    func readMe(success: @escaping ReadMeSuccess, failure: ReadMeFailure?) -> URLSessionTask?

}
