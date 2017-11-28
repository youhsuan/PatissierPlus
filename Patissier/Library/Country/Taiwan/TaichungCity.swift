//
//  TaichungCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TaichungCity

import Foundation

public struct TaichungCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Taichung City",
            comment: ""
        )

    }

    public let postalCodes = [
        "400", "401", "402", "403", "404", "406", "407", "408",
        "411", "412", "413", "414",
        "420", "421", "422", "423", "424", "426", "427", "428", "429",
        "432", "433", "434", "435", "436", "437", "438", "439"
    ]

    public let isCapital = false

}
