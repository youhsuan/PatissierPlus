//
//  TabBarItem.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TabBarItem

import UIKit

class TabBarItem: UITabBarItem {

    // MARK: Property

    var itemType: TabBarItemType?

    // MARK: Init

    init(itemType: TabBarItemType) {

        super.init()

        self.itemType = itemType

        self.title = itemType.title

        self.image = itemType.image

        self.selectedImage = itemType.selectedImage

    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

    }

}
