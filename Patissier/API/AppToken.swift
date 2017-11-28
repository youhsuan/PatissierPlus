//
//  AppToken.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - AppTokenError

enum AppTokenError: Error {

    case unsupportedTokenType

}

// MARK: - AppToken

struct AppToken {

    // MARK: TokenType

    enum TokenType: String {

        // MARK: Property

        case basic

        case bearer

    }

    // MARK: Schema

    struct Schema {

        // MARK: Property

        static let tokenType = "token_type"

        static let token = "token"

    }

    // MARK: Property

    let tokenType: TokenType

    let tokenString: String

    // MARK: Init

    init(type tokenType: TokenType, tokenString: String) {

        self.tokenType = tokenType

        self.tokenString = tokenString

    }

    init(type tokenTypeString: String, tokenString: String) throws {

        guard
            let tokenType = TokenType(rawValue: tokenTypeString)
            else { throw AppTokenError.unsupportedTokenType }

        self.tokenType = tokenType

        self.tokenString = tokenString

    }

}

// MARK: - Unboxable

import Unbox

extension AppToken.TokenType: UnboxableEnum { }

extension AppToken: Unboxable {

    init(unboxer: Unboxer) throws {

        let tokenType: TokenType = try unboxer.unbox(key: Schema.tokenType)

        let tokenString: String = try unboxer.unbox(key: Schema.token)

        self.init(
            type: tokenType,
            tokenString: tokenString
        )

    }

}

// MARK: - Keychain

import KeychainAccess

extension Keychain {

    // MARK: Property

    static let appToken = Keychain(service: "\(Bundle.main.bundleIdentifier!).AppToken")

}

// MARK: - KeychainConvertible

extension AppToken: KeychainExportable {

    // MARK: KeychainExportable

    func save(to keychain: Keychain) throws {

        try keychain.set(tokenType.rawValue, key: Schema.tokenType)

        try keychain.set(tokenString, key: Schema.token)

    }

}
