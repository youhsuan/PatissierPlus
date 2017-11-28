//
//  NantouCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - NantouCounty

import Foundation

public struct NantouCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Nantou County",
            comment: ""
        )

    }

    public let postalCodes = [
        "540", "541", "542", "544", "545", "546",
        "551", "552", "553", "555", "556", "557", "558"
    ]

    public let isCapital = false

}
