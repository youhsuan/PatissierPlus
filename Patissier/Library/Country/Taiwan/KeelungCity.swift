//
//  KeelungCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - KeelungCity

import Foundation

public struct KeelungCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Keelung City",
            comment: ""
        )

    }

    public let postalCodes = [
        "200", "201", "202", "203", "204", "205", "206"
    ]

    public let isCapital = false

}
