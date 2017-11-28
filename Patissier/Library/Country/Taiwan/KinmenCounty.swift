//
//  KinmenCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - KinmenCounty

import Foundation

public struct KinmenCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Kinmen County",
            comment: ""
        )

    }

    public let postalCodes = [
        "890", "891", "892", "893", "894", "896"
    ]

    public let isCapital = false

}
