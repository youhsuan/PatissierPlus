//
//  RecipientTitle.swift
//  Patissier
//
//  Created by Roy Hsu on 11/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - RecipientTitle

import Foundation

public enum RecipientTitle: String {

    // MARK: Case

    case mister

    case miss

}

// MARK: - CustomStringConvertible

extension RecipientTitle: CustomStringConvertible {

    public var description: String {

        switch self {

        case .mister:

            return NSLocalizedString(
                "Mr.",
                comment: ""
            )

        case .miss:

            return NSLocalizedString(
                "Ms.",
                comment: ""
            )

        }

    }

}
