//
//  PersistenceManager.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PersistenceManager

import CoreData

public final class PersistenceManager {

    // MARK: Property

    public let container: NSPersistentContainer

    // MARK: Init

    public init(container: NSPersistentContainer) {

        self.container = container

    }

}

// MARK: - PersistenceDelegate

extension PersistenceManager: PersistenceDelegate {

    public func performTask<Result>(
        in queue: PersistenceQueue,
        execution task: @escaping (_ context: NSManagedObjectContext) throws -> Result
    )
    rethrows -> Result {

        switch queue {

        case .main:

            let context = container.viewContext

            return try task(context)

        case .background:

            let context = container.newBackgroundContext()

            return try task(context)

        }

    }

}
