//
//  ModelID.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ModelID

import Unbox

public protocol ModelID: ID, UnboxableByTransform { }

// MARK: - UnboxableByTransform (Default Implementation)

public extension ModelID where RawValue == UnboxRawValue {

    public static func transform(unboxedValue: Self.UnboxRawValue) -> Self? {

        return Self.init(unboxedValue)

    }

}

// MARK: - Equatable (Default Implementation)

public extension ModelID where RawValue == UnboxRawValue {

    // swiftlint:disable operator_whitespace
    public static func ==(
        lhs: Self,
        rhs: Self
    )
    -> Bool {

        return lhs.rawValue == rhs.rawValue

    }
    // swiftlint:enable operator_whitespace

}
