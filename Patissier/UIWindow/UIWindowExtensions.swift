//
//  UIWindowExtensions.swift
//  Patissier
//
//  Created by Roy Hsu on 26/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - UIWindowExtensions

import UIKit

// MARK: - Update Root View Controller

extension UIWindow {

    typealias UpdateRootCompletion = (Bool) -> Void

    typealias UpdateRootAnimation = (_ from: UIViewController?, _ to: UIViewController, _ completion: UpdateRootCompletion?) -> Void

    func updateRoot(
        to newViewController: UIViewController,
        animation: UpdateRootAnimation,
        completion: UpdateRootCompletion?
    ) {

        let fromViewController = rootViewController

        let toViewController = newViewController

        rootViewController = toViewController

        animation(
            fromViewController,
            toViewController,
            completion
        )

    }

}
