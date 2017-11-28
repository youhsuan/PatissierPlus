//
//  ModelError.swift
//  Patissier
//
//  Created by Roy Hsu on 30/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ModelError

import CoreData

public enum ModelError: Error {

    // MARK: Case

    case invalidEntityType(
        NSManagedObject.Type,
        expectedType: NSManagedObject.Type
    )

    case missingValueForKey(String)

}
