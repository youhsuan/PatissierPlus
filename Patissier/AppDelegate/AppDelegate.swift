//
//  AppDelegate.swift
//  Patissier
//
//  Created by Roy Hsu on 22/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - AppDelegate

import CoreData
import FBSDKCoreKit
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Property

    var window: UIWindow?

    var persistenceManager: PersistenceManager?

    // MARK: App Life Cycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let persistenceManager = PersistenceManager(
            container: NSPersistentContainer(name: "Main")
        )

        persistenceManager.container.loadPersistentStores { _, error in

            if let error = error {

                // Todo: error handling.

                print("\(error)")

                return

            }

        }

        self.persistenceManager = persistenceManager

        FBSDKApplicationDelegate.sharedInstance().application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        let entryViewController = makeEntryController()

        let window = UIWindow(frame: UIScreen.main.bounds)

        window.rootViewController = entryViewController

        window.makeKeyAndVisible()

        self.window = window

        return true

    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)

    }

    func makeEntryController() -> UIViewController {

        do {

            try UserManager.shared.restore(from: .appToken)

            return TabBarController(
                itemTypes: [ .store, .profile ]
            )

        }
        catch {

            return UIViewController.load(
                LandingViewController.self,
                from: .landing
            )

        }

    }

}
