//
//  AppDelegateExtensions.swift
//  Patissier
//
//  Created by Roy Hsu on 26/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Shared App Delegate

import UIKit

extension AppDelegate {

    // swiftlint:disable force_cast
    class var shared: AppDelegate {

        return UIApplication.shared.delegate as! AppDelegate

    }
    // swiftlint:enable force_cast

}
