//
//  PenghuCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PenghuCounty

import Foundation

public struct PenghuCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Penghu County",
            comment: ""
        )

    }

    public let postalCodes = [
        "880", "881", "882", "883", "884", "885"
    ]

    public let isCapital = false

}
