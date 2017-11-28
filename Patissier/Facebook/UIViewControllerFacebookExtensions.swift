//
//  UIViewControllerFacebookExtensions.swift
//  TinyWorld
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - UIViewController

import FBSDKLoginKit
import UIKit

extension UIViewController {

    // MARK: Request Pemission Group

    typealias RequestPermissionGroupSuccess = (Facebook) -> Void

    typealias RequestPermissionGroupFailure = (Error) -> Void

    func requestPermissionGroup(_ group: PermissionGroup, success: @escaping RequestPermissionGroupSuccess, failure: RequestPermissionGroupFailure?) {

        let handler: FBSDKLoginManagerRequestTokenHandler = { result, error in

            if let error = error {

                failure?(error)

                return

            }

            guard let result = result else {

                failure?(FacebookError.noResult)

                return

            }

            if result.isCancelled {

                failure?(FacebookError.isCancelled)

                return

            }

            do {

                let token = result.token!

                let facebook = Facebook(token: token)

                try facebook.validatePermissionGroup(group)

                success(facebook)

            } catch { failure?(error) }

        }

        switch group {

        case .read(let required):

            let permissions = required.map { $0.rawValue }

            FBSDKLoginManager().logIn(
                withReadPermissions: permissions,
                from: self,
                handler: handler
            )

        case .publish(let required):

            let permissions = required.map { $0.rawValue }

            FBSDKLoginManager().logIn(
                withPublishPermissions: permissions,
                from: self,
                handler: handler
            )

        }

    }

}
