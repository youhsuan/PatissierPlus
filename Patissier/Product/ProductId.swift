//
//  ProductID.swift
//  Patissier
//
//  Created by Roy Hsu on 23/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductID

public struct ProductID: ModelID {

    public typealias RawValue = String

    public typealias UnboxRawValue = RawValue

    // MARK: Property

    public var rawValue: RawValue

    // MARK: Init

    public init(_ rawValue: RawValue) {

        self.rawValue = rawValue

    }

}
