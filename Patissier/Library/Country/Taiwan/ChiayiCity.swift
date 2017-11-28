//
//  ChiayiCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ChiayiCity

import Foundation

public struct ChiayiCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Chiayi City",
            comment: ""
        )

    }

    public let postalCodes = [ "600" ]

    public let isCapital = false

}
