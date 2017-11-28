//
//  TabBarController.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TabBarControllerTests

import UIKit

class TabBarController: UITabBarController {

    // MARK: Init

    init(itemTypes: [TabBarItemType]) {

        super.init(nibName: nil, bundle: nil)

        let viewControllers: [UIViewController] = itemTypes.map(
            TabBarController.prepare
        )

        setViewControllers(viewControllers, animated: false)

    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

    }

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBar()

    }

    // MARK: Set Up

    private func setUpTabBar() {

        tabBar.barStyle = .default

        tabBar.isTranslucent = false

        // Todo: palette
        tabBar.tintColor = UIColor(
            red: 53.0 / 255.0,
            green: 184.0 / 255.0,
            blue: 208 / 255.0,
            alpha: 1.0
        )

    }

    // MARK: Prepare Item Type

    static func prepare(for itemType: TabBarItemType) -> UIViewController {

        switch itemType {

        case .store:

            let client = APIClient()

            if let token = UserManager.shared.appToken {

                client.sessionManager.adapter = AccessTokenAdapter(token: token)

            }

            let likedProductsProvider = LikedProductsController()

            // todo: inject persistence delegate instead of using singleton AppDelegate.shared
            likedProductsProvider.persistenceDelegate = AppDelegate.shared.persistenceManager

            let provider = ProductAPIProvider(client: client)

            // swiftlint:disable force_try
            let productGridViewController = try! ProductGridCollectionViewController(
                width: UIScreen.main.bounds.width, // Todo: replace UIScreen with the view of root view controller.
                provider: provider
            )
            // swiftlint:enable force_try

            // todo: inject persistence delegate instead of using singleton AppDelegate.shared
            productGridViewController.persistenceDelegate = AppDelegate.shared.persistenceManager

            productGridViewController.likedProductsProvider = likedProductsProvider

            productGridViewController.provider!.fetch()

            let navigationController = GradientNavigationController(
                rootViewController: productGridViewController
            )

            navigationController.tabBarItem = TabBarItem(
                itemType: itemType
            )

            return navigationController

        case .profile:

            let profileTableViewController = ProfileTableViewController(style: .plain)

            let navigationController = GradientNavigationController(
                rootViewController: profileTableViewController
            )

            navigationController.tabBarItem = TabBarItem(
                itemType: itemType
            )

            return navigationController

        }

    }

}
