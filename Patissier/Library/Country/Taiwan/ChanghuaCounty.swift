//
//  ChanghuaCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ChanghuaCounty

import Foundation

public struct ChanghuaCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Changhua County",
            comment: ""
        )

    }

    public let postalCodes = [
        "500", "502", "503", "504", "505", "506", "507", "508", "509",
        "510", "511", "512", "513", "514", "515", "516",
        "520", "521", "522", "523", "524", "525", "526", "527", "528",
        "530"
    ]

    public let isCapital = false

}
