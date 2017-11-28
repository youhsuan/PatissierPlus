//
//  YunlinCounty.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - YunlinCounty

import Foundation

public struct YunlinCounty: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Yunlin County",
            comment: ""
        )

    }

    public let postalCodes = [
        "630", "631", "632", "633", "634", "635", "636", "637", "638",
        "640", "643", "646", "647", "648", "649",
        "651", "652", "653", "654", "655"
    ]

    public let isCapital = false

}
