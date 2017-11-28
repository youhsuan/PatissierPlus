//
//  TinanCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TainanCity

import Foundation

public struct TainanCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Tainan City",
            comment: ""
        )

    }

    public let postalCodes = [
        "700", "701", "702", "703", "704", "708", "709",
        "710", "711", "712", "713", "714", "715", "716", "717", "718", "719",
        "720", "721", "722", "723", "724", "725", "726", "727",
        "730", "731", "732", "733", "734", "735", "736", "737",
        "741", "742", "743", "744", "745"
    ]

    public let isCapital = false

}
