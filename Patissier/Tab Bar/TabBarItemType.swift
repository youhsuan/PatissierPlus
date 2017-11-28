//
//  TabBarItemType.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TabBarItemType

import UIKit

enum TabBarItemType {

    // MARK: Case

    case store, profile

}

// MARK: - Title

extension TabBarItemType {

    var title: String {

        switch self {

        case .store:

            return NSLocalizedString("Store", comment: "")

        case .profile:

            return NSLocalizedString("Profile", comment: "")

        }

    }

}

// MARK: - Image

extension TabBarItemType {

    var image: UIImage {

        switch self {

        case .store:

            return #imageLiteral(resourceName: "icon-store").withRenderingMode(.alwaysTemplate)

        case .profile:

            return #imageLiteral(resourceName: "icon-profile").withRenderingMode(.alwaysTemplate)

        }

    }

    var selectedImage: UIImage? {

        switch self {

        case .store:

            return nil

        case .profile:

            return #imageLiteral(resourceName: "icon-profile-selected").withRenderingMode(.alwaysTemplate)

        }

    }

}
