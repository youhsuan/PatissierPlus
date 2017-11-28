//
//  UserManager.swift
//  Patissier
//
//  Created by Roy Hsu on 08/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Result

public enum Result<Value> {

    case success(Value)

    case failure(Error)

}

// MARK: - UserManager

import KeychainAccess

class UserManager {

    // MARK: Property

    static let shared = UserManager()

    private(set) var appToken: AppToken?

    var hasSignedIn: Bool { return appToken != nil }

    // MARK: Restore

    typealias RestoreCompletion = (Result<AppToken>) -> Void

    enum RestoreError: Error {

        case missingValue(key: String)

    }

    func restore(from keychain: Keychain) throws {

        typealias Schema = AppToken.Schema

        guard
            let tokenTypeString = try keychain.get(Schema.tokenType)
            else {

                throw RestoreError.missingValue(
                    key: Schema.tokenType
                )

            }

        guard
            let tokenString = try keychain.get(Schema.token)
            else {

                throw RestoreError.missingValue(
                    key: Schema.token
                )

            }

        appToken = try AppToken(
            type: tokenTypeString,
            tokenString: tokenString
        )

    }

}
