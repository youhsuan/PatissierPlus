//
//  HsinchuCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - HsinchuCity

import Foundation

public struct HsinchuCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Hsinchu City",
            comment: ""
        )

    }

    public let postalCodes = [ "300" ]

    public let isCapital = false

}
