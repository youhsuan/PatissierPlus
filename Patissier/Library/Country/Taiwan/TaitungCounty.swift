//
//  TaitungCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TaitungCounty

import Foundation

public struct TaitungCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Taitung County",
            comment: ""
        )

    }

    public let postalCodes = [
        "950", "951", "952", "953", "954", "955", "956", "957", "958", "959",
        "961", "962", "963", "964", "965", "966"
    ]

    public let isCapital = false

}
