//
//  Item.swift
//  Patissier
//
//  Created by Roy Hsu on 11/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ItemType

public enum ItemType {

    // MARK: Case

    case product

}

// MARL - Item

import Foundation

public protocol Item {

    var title: String { get }

    var price: Double { get }

    var previewImageURL: URL { get }

    static var itemType: ItemType { get }

}
