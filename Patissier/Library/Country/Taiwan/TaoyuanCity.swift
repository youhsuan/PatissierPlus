//
//  TaoyuanCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TaoyuanCity

import Foundation

public struct TaoyuanCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Taoyuan City",
            comment: ""
        )

    }

    public let postalCodes = [
        "320", "324", "325", "326", "327", "328",
        "330", "333", "334", "335", "336", "337", "338"
    ]

    public let isCapital = false

}
