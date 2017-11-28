//
//  Facebook.swift
//  TinyWorld
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ReadPermission

enum ReadPermission: String {

    // MARK: Property

    case publicProfile = "public_profile"

    case email = "email"

}

// MARK: - PublishPermission

enum PublishPermission: String {

    // MARK: Property

    case publishActions = "publish_actions"

}

// MARK: - PermissionGroup

enum PermissionGroup {

    // MARK: Property

    case read(required: Set<ReadPermission>)

    case publish(required: Set<PublishPermission>)

}

// MARK: - FacebookError

enum FacebookError: Error {

    // MARK: Property

    case missingReadPermissions(Set<ReadPermission>)

    case missingPublishPermissions(Set<PublishPermission>)

    case noResult

    case isCancelled

}

// MARK: - Facebook

import FBSDKCoreKit

struct Facebook {

    // MARK: Property

    let token: FBSDKAccessToken

    // MARK: Validate Permission Group

    func validatePermissionGroup(_ group: PermissionGroup) throws {

        switch group {

        case .read(let required):

            let lacked = required.filter {

                let permission = $0.rawValue

                let isLack = !token.hasGranted(permission)

                return isLack

            }

            if !lacked.isEmpty {

                throw FacebookError.missingReadPermissions(
                    Set<ReadPermission>(lacked)
                )

            }

        case .publish(let required):

            let lacked = required.filter {

                let permission = $0.rawValue

                let isLack = !token.hasGranted(permission)

                return isLack

            }

            if !lacked.isEmpty {

                throw FacebookError.missingPublishPermissions(
                    Set<PublishPermission>(lacked)
                )

            }

        }

    }

}
