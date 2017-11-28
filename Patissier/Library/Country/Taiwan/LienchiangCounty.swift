//
//  LienchiangCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LienchiangCounty

import Foundation

public struct LienchiangCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Lienchiang County",
            comment: ""
        )

    }

    public let postalCodes = [
        "209",
        "210", "211", "212"
    ]

    public let isCapital = false

}
