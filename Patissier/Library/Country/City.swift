//
//  City.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - City

public protocol City {

    // MARK: Property

    var name: String { get }

    var postalCodes: [String] { get }

    var isCapital: Bool { get }

}
