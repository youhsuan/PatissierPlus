//
//  PersistenceRepresentable.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PersistentRepresentable

import CoreData

public protocol PersistenceRepresentable {

    func makeManagedObject(in context: NSManagedObjectContext) throws -> NSManagedObject

}
