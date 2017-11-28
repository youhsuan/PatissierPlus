//
//  UIViewControllerStoryboardExtensions.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Storyboard

import UIKit

extension UIViewController {

    static func load<VC: UIViewController>(_ type: VC.Type, from storyboard: UIStoryboard) -> VC {

        let identifier = String(describing: type)

        let controller = storyboard
            .instantiateViewController(withIdentifier: identifier)

        // swiftlint:disable force_cast
        return controller as! VC
        // swiftlint:enable force_cast

    }

}
