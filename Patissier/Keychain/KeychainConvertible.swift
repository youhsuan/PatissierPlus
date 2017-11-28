//
//  KeychainConvertible.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - KeychainInitializable

import KeychainAccess

protocol KeychainInitializable {

    // MARK: Init

    init(keychain: Keychain) throws

}

// MARK: - KeychainExportable

protocol KeychainExportable {

    func save(to keychain: Keychain) throws

}

// MARK: - KeychainConvertible

protocol KeychainConvertible: KeychainInitializable, KeychainExportable {

}

// MARK: - KeychainError

enum KeychainError: Error {

    // MARK: Property

    case missingValue(forKey: String)

}
