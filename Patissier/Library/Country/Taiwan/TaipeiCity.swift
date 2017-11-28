//
//  TaipeiCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TaipeiCity

import Foundation

public struct TaipeiCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Taipei City",
            comment: ""
        )

    }

    public let postalCodes = [
        "100", "103", "104", "105", "106", "108",
        "110", "111", "112", "114", "115", "116"
    ]

    public let isCapital = true

}
