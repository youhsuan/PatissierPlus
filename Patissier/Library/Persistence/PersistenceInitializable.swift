//
//  PersistenceInitializable.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PersistentInitializable

import CoreData

public protocol PersistenceInitializable {

    init(_ managedObject: NSManagedObject) throws

}
