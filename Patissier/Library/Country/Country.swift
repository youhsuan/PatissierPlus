//
//  Country.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Country

public protocol Country {

    // The country code defined in ISO standards.
    var code: String { get }

    var cities: [City] { get }

    var capitalCity: City { get }

}
