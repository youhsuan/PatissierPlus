//
//  PersistenceDelegate.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PersistenceDelegate

import CoreData

public protocol PersistenceDelegate: class {

    @discardableResult
    func performTask<Result>(
        in queue: PersistenceQueue,
        execution task: @escaping (_ context: NSManagedObjectContext) throws -> Result
    )
    rethrows -> Result

}
