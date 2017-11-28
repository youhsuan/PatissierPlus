//
//  YilanCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - YilanCounty

import Foundation

public struct YilanCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Yilan County",
            comment: ""
        )

    }

    public let postalCodes = [
        "260", "261", "262", "263", "264", "265", "266", "267", "268", "269",
        "270", "272",
        "290"
    ]

    public let isCapital = false

}
