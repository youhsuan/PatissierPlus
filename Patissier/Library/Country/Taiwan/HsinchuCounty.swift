//
//  HsinchuCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - HsinchuCounty

import Foundation

public struct HsinchuCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Hsinchu County",
            comment: ""
        )

    }

    public let postalCodes = [
        "302", "303", "304", "305", "306", "307", "308",
        "310", "311", "312", "313", "314", "315"
    ]

    public let isCapital = false

}
