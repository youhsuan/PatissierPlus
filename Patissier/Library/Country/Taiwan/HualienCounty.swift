//
//  HualienCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - HualienCounty

import Foundation

public struct HualienCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Hualien County",
            comment: ""
        )

    }

    public let postalCodes = [
        "970", "971", "972", "973", "974", "975", "976", "977", "978", "979",
        "981", "982", "983"
    ]

    public let isCapital = false

}
