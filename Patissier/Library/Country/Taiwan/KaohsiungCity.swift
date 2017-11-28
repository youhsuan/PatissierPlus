//
//  KaohsiungCity.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Kaohsiung City

import Foundation

public struct KaohsiungCity: City {

    // MARK: Property

    public var name: String {

        return NSLocalizedString(
            "Kaohsiung City",
            comment: ""
        )

    }

    public let postalCodes = [
        "800", "801", "802", "803", "804", "805", "806", "807",
        "811", "812", "813", "814", "815", "817", "819",
        "820", "821", "822", "823", "824", "825", "826", "827", "828", "829",
        "830", "831", "832", "833",
        "840", "842", "843", "844", "845", "846", "847", "848", "849",
        "851", "852"
    ]

    public let isCapital = false

}
