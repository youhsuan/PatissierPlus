//
//  NewTaipeiCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - NewTaipeiCity

import Foundation

public struct NewTaipeiCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "New Taipei City",
            comment: ""
        )

    }

    public let postalCodes = [
        "207", "208",
        "220", "221", "222", "223", "224", "226", "227", "228",
        "231", "232", "233", "234", "235", "236", "237", "238", "239",
        "241", "242", "243", "244", "247", "248", "249",
        "251", "252", "253"
    ]

    public let isCapital = false

}
