//
//  ProfileTableViewController.swift
//  Patissier
//
//  Created by Roy Hsu on 27/08/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Component

enum ProfileComponent {

    // MARK: Case

    case information, segmentedControl, content

}

// MARK: - ProfileTableViewController

import Cartography
import Nuke
import UIKit

class ProfileTableViewController: UITableViewController {

    // MARK: Segment

    typealias Segment = ProfileSegmentedControlTableViewCell.Segment

    // MARK: Property

    let components: [ProfileComponent] = [ .information, .segmentedControl, .content ]

    var selectedSegment: Segment = .left

    private(set) var unusedFavoriteProviderPool: [IndexPath: ProductProvider] = [:]

    private(set) var displayingFavoriteControllerPool: [IndexPath: ProductGridCollectionViewController] = [:]

    private var user: User? {

        didSet { tableView.reloadData() }

    }

    // MARK: View Lifc Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()

        // Todo: development only
        try? UserManager.shared.restore(from: .appToken)

        if let token = UserManager.shared.appToken {

            let client = APIClient()

            client.sessionManager.adapter = AccessTokenAdapter(token: token)

            client.readMe(
                success: { user in

                    self.user = user

                },
                failure: { error in

                    print("\(error)")

                    // Todo: error handling

                }
            )

        }

    }

    // MARK: Set Up

    private func setUpTableView() {

        let nib1 = UINib(
            nibName: "ProfileInformationTableViewCell",
            bundle: nil
        )

        tableView.register(
            nib1,
            forCellReuseIdentifier: "ProfileInformationTableViewCell"
        )

        let nib2 = UINib(
            nibName: "ProfileSegmentedControlTableViewCell",
            bundle: nil
        )

        tableView.register(
            nib2,
            forCellReuseIdentifier: "ProfileSegmentedControlTableViewCell"
        )

        tableView.separatorStyle = .none

        tableView.backgroundColor = UIColor(
            red: 250.0 / 255.0,
            green: 250.0 / 255.0,
            blue: 250.0 / 255.0,
            alpha: 1.0
        )

    }

    // MARK: UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {

        return components.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let component = components[section]

        switch component {

        case .information, .segmentedControl:

            return 1

        case .content:

            let indexPath = IndexPath(row: 0, section: section)

            switch selectedSegment {

            case .left:

                if let displayingProvider = displayingFavoriteControllerPool[indexPath]?.provider {

                    return displayingProvider.numberOfProducts

                }

                var provider: ProductProvider?

                if let reusableProvider = unusedFavoriteProviderPool.removeValue(forKey: indexPath) {

                    provider = reusableProvider

                } else {

                    guard
                        let token = UserManager.shared.appToken
                        else { return 0 }

                    // Todo: replace APIClient with core data.
                    let client = APIClient()

                    client.sessionManager.adapter = AccessTokenAdapter(token: token)

                    let newProvider = ProductAPIProvider(client: client)

                    provider = newProvider

                }

                guard
                    let foundProvider = provider,
                    let favoriteController = try? ProductGridCollectionViewController(
                        width: tableView.bounds.width,
                        provider: foundProvider
                    )
                    else { return 0 }

                displayingFavoriteControllerPool[indexPath] = favoriteController

                // Todo: handle loading more data with profile view controller instead of child controller
                favoriteController.isAutoFetching = false

                favoriteController.delegate = self

                // Todo: temporarily disble scrolling that will conflict with the parent scroll view. This also make the cell unselectable, should find a better way to handle scrolling conflicts.
                favoriteController.collectionView?.isUserInteractionEnabled = false

                if foundProvider.hasMoreProducts {

                    foundProvider.fetch()

                }

                return foundProvider.numberOfProducts

            case .right:

                // Todo: purchased
                return 0

            }

        }

    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return 44.0

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let component = components[indexPath.section]

        switch component {

        case .information:

            let aspectRatio: CGFloat = 375.0 / 200.0

            let width = tableView.bounds.width

            let height = width / aspectRatio

            return height

        case .segmentedControl:

            return UITableViewAutomaticDimension

        case .content:

            switch selectedSegment {

            case .left:

                guard
                    let favoriteController = displayingFavoriteControllerPool[indexPath]
                    else { return 0.0 }

                favoriteController.collectionView?.reloadData()

                // Note: the content size is equal to zero after reloading data. You must use the collectionViewContentSize property under collectionViewLayout to get the actual size.
                // Reference: https://stackoverflow.com/questions/19103333/contentsize-is-not-updated-after-reloaddata-is-called-on-uicollectionview
                return favoriteController.collectionViewLayout.collectionViewContentSize.height

            case .right:

                // Todo: purchased
                return 0.0

            }

        }

    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let component = components[indexPath.section]

        switch component {

        case .content:

            switch selectedSegment {

            case .left:

                guard
                    let favoriteController = displayingFavoriteControllerPool[indexPath],
                    let favoriteView = favoriteController.view
                    else { return }

                addChildViewController(favoriteController)

                cell.contentView.addSubview(favoriteView)

                constrain(favoriteView) { favoriteView in

                    guard
                        let superview = favoriteView.superview
                        else { return }

                    favoriteView.edges == superview.edges

                }

                favoriteController.didMove(toParentViewController: self)

            case .right:

                // Todo: purchased
                break

            }

        case .information, .segmentedControl:

            break

        }

    }

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let component = components[indexPath.section]

        switch component {

        case .content:

            switch selectedSegment {

            case .left:

                guard
                    let favoriteController = displayingFavoriteControllerPool.removeValue(forKey: indexPath),
                    let favoriteView = favoriteController.view
                    else { return }

                if let provider = favoriteController.provider {

                    unusedFavoriteProviderPool[indexPath] = provider

                }

                favoriteController.willMove(toParentViewController: nil)

                favoriteView.removeFromSuperview()

                favoriteController.removeFromParentViewController()

            case .right:

                // Todo: purchased
                break

            }

        case .information, .segmentedControl:

            break

        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let component = components[indexPath.section]

        switch component {

        case .information:

            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileInformationTableViewCell",
                for: indexPath
                ) as! ProfileInformationTableViewCell
            // swiftlint:enable force_cast

            cell.nameLabel.text = user?.name

            cell.selectionStyle = .none

            if let pictureImageURL = user?.pictureImageURL {

                Nuke.loadImage(with: pictureImageURL, into: cell.pictureImageView)

            }

            return cell

        case .segmentedControl:

            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileSegmentedControlTableViewCell",
                for: indexPath
                ) as! ProfileSegmentedControlTableViewCell
            // swiftlint:enable force_cast

            cell.leftTitle = NSLocalizedString("Favorite", comment: "")

            cell.rightTitle = NSLocalizedString("Purchased", comment: "")

            cell.delegate = self

            cell.selectedSegment = selectedSegment

            cell.selectionStyle = .none

            return cell

        case .content:

            let cell = UITableViewCell()

            cell.selectionStyle = .none

            return cell

        }

    }

}

// MARK: - ProfileSegmentedControlTableViewCellDelegate

extension ProfileTableViewController: ProfileSegmentedControlTableViewCellDelegate {

    func cell(_ cell: ProfileSegmentedControlTableViewCell, didSelect segment: ProfileSegmentedControlTableViewCell.Segment) {

        selectedSegment = segment

        // Todo: implmentation of favorite and purchased.

    }

}

// MARK: - ProductGridCollectionViewControllerDelegate

extension ProfileTableViewController: ProductGridCollectionViewControllerDelegate {

    func controller(_ controller: ProductGridCollectionViewController, didChange state: ProductGridCollectionViewController.State) {

//        guard
//            let provider = controller.provider,
//            let displaying = displayingFavoriteControllerPool
//                .filter({ $0.value.provider === provider })
//                .first
//            else { return }
//
//        let indexPath = displaying.key
//
//        // Todo: will crash because of refreshing too early
////        tableView.reloadRows(at: [ indexPath ], with: .automatic)

        tableView.reloadData()

    }

    func controller(_ controller: ProductGridCollectionViewController, didFailWith error: Error) {

        // Todo: error handling
        print("\(error)")

    }

}
