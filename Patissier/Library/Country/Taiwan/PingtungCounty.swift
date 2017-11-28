//
//  PingtungCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PingtungCounty

import Foundation

public struct PingtungCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Pingtung County",
            comment: ""
        )

    }

    public let postalCodes = [
        "900", "901", "902", "903", "904", "905", "906", "907", "908", "909",
        "911", "912", "913",
        "920", "921", "922", "923", "924", "925", "926", "927", "928", "929",
        "931", "932",
        "940", "941", "942", "943", "944", "945", "946", "947"
    ]

    public let isCapital = false

}
