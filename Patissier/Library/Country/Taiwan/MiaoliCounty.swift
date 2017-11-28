//
//  MiaoliCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - MiaoliCounty

import Foundation

public struct MiaoliCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Miaoli County",
            comment: ""
        )

    }

    public let postalCodes = [
        "350", "351", "352", "353", "354", "356", "357", "358",
        "360", "361", "362", "363", "364", "365", "366", "367", "368", "369"
    ]

    public let isCapital = false

}
