//
//  ChiayiCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ChiayiCounty

import Foundation

public struct ChiayiCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Chiayi County",
            comment: ""
        )

    }

    public let postalCodes = [
        "602", "603", "604", "605", "606", "607", "608",
        "611", "612", "613", "614", "615", "616",
        "621", "622", "623", "624", "625"
    ]

    public let isCapital = false

}
