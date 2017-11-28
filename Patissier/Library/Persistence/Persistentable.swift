//
//  Persistentable.swift
//  Patissier
//
//  Created by Roy Hsu on 25/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Persistentable

public protocol Persistentable: PersistenceInitializable, PersistenceRepresentable { }

// MARK: - Save

import CoreData

public extension Persistentable {

    public func save(in context: NSManagedObjectContext) throws {

        let object = try makeManagedObject(in: context)

        context.insert(object)

        try context.save()

    }

}
