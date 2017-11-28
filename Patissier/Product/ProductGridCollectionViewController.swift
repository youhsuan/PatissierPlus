//
//  ProductGridCollectionViewController.swift
//  Patissier
//
//  Created by Roy Hsu on 27/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductGridCollectionViewControllerDelegate

protocol ProductGridCollectionViewControllerDelegate: class {

    func controller(_ controller: ProductGridCollectionViewController, didChange state: ProductGridCollectionViewController.State)

    func controller(_ controller: ProductGridCollectionViewController, didFailWith error: Error)

}

// MARK: - ProductGridCollectionViewController

import CoreData
import Nuke
import UIKit

class ProductGridCollectionViewController: UICollectionViewController, UICollectionViewDataSourcePrefetching, ProductProviderDelegate {

    // MARK: State

    enum State {

        case preparing

        case ready

    }

    // MARK: Property

    private(set) var state: State {

        didSet { collectionView?.reloadData() }

    }

    var numberOfFetchingRows: Int { return 10 } // May not be the actual number of objects that server returns and it should be greater than the number of visible cells

    weak var delegate: ProductGridCollectionViewControllerDelegate?

    weak var persistenceDelegate: PersistenceDelegate?

    // Todo: find a better way to handle the potential memory leaks because marks it as weak won't be able to hold the reference to the instance of LikedProductsProvider.
    var likedProductsProvider: LikedProductsProvider?

    /// Make sure to always have a data provider. 
    /// Prevent init(collectionViewLayout:) inheritance complaining to set a value but it's marked as private function that is impossible to access outside of the controller.
    var provider: ProductProvider! {

        didSet { provider.delegate = self }

    }

    var isAutoFetching = true {

        didSet {

            collectionView?.prefetchDataSource = isAutoFetching ? self : nil

        }

    }

    // MARK: Init

    init(width: CGFloat, provider: ProductProvider) throws {

        let factory = try ProductGridCollectionViewLayoutFactory(
            width: width
        )

        let layout = try factory.makeLayout()

        self.state = provider.hasMoreProducts ? .preparing : .ready

        self.provider = provider

        super.init(collectionViewLayout: layout)

        self.provider.delegate = self

        setUpCollectionView()

    }

    fileprivate override init(collectionViewLayout layout: UICollectionViewLayout) {

        fatalError("Not implemented.")

    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("This view controller doesn't support storyboard.")

    }

    // MARK: View Life Cycle

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        super.viewWillTransition(to: size, with: coordinator)

        do {
            // Todo: use protocol to ask for new layout for better DI
            let factory = try ProductGridCollectionViewLayoutFactory(
                width: size.width
            )

            let newLayout = try factory.makeLayout()

            let oldLayout = collectionView!.collectionViewLayout

            oldLayout.invalidateLayout()

            collectionView!.collectionViewLayout = newLayout

            coordinator.animate(
                alongsideTransition: { _ in

                    self.collectionView!.layoutIfNeeded()

                },
                completion: nil
            )

        } catch {

            // Todo: error handling

            print("\(error)")

        }

    }

    // MARK: Set Up

    private func setUpCollectionView() {

        collectionView!.backgroundColor = UIColor(
            red: 250.0 / 255.0,
            green: 250.0 / 255.0,
            blue: 250.0 / 255.0,
            alpha: 1.0
        )

        collectionView!.register(
            ProductGridCollectionViewCell.self,
            withNibIn: .main
        )

        collectionView!.prefetchDataSource = isAutoFetching ? self : nil

    }

    // MARK: Action

    @objc func likeProduct(_ sender: Any) {

        guard
            let collectionView = collectionView,
            let button = sender as? UIButton,
            let cell = button.superview?.superview?.superview as? UICollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell)
        else { fatalError("Cannot determine index path of the sender.") }

        guard
            let persistenceDelegate = persistenceDelegate,
            let likedProductsProvider = self.likedProductsProvider
        else { fatalError("Please make sure to assign persistence delegate and liked products provider.") }

        let product = provider.product(at: indexPath)

        do {

            // Todo: use background queue to modify objects and save the changes with background won't affect the view context.
            try persistenceDelegate.performTask(in: .main) { context in

                let isLikedProduct = likedProductsProvider.isLikedProduct(id: product.id)

                if isLikedProduct {

                    try likedProductsProvider.removeLikeFromProduct(id: product.id)

                    try context.save()

                } else {

                    try likedProductsProvider.likeProduct(id: product.id)

                    try context.save()

                }

                DispatchQueue.main.async {

                    self.collectionView?.reloadItems(at: [ indexPath ])

                }

            }

        } catch {

            let alertController = UIAlertController(
                title: nil,
                message: error.localizedDescription,
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(
                title: NSLocalizedString(
                    "OK",
                    comment: ""
                ),
                style: .cancel,
                handler: nil
            )

            alertController.addAction(okAction)

            present(
                alertController,
                animated: true,
                completion: nil
            )

        }

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch state {

        case .preparing:

            return numberOfFetchingRows

        case .ready:

            if provider.hasMoreProducts && isAutoFetching {

                return provider.numberOfProducts + numberOfFetchingRows

            } else {

                return provider.numberOfProducts

            }

        }

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductGridCollectionViewCell.identifier,
            for: indexPath
        ) as! ProductGridCollectionViewCell
        // swiftlint:enable force_cast

        switch state {

        case .preparing:

            // Todo: add loading cell animation
            cell.contentView.backgroundColor = .gray

        case .ready:

            let isFetched = indexPath.row < provider.numberOfProducts

            if isFetched {

                cell.contentView.backgroundColor = .clear

                let product = provider.product(at: indexPath)

                cell.priceLabel.text = "$\(product.price)"

                cell.titleLabel.text = product.name

                cell.likeButton.addTarget(
                    self,
                    action: #selector(ProductGridCollectionViewController.likeProduct),
                    for: .touchUpInside
                )

                cell.isLiked =
                    likedProductsProvider?.isLikedProduct(id: product.id)
                    ?? false

                cell.previewImageView.image = nil

                Nuke.loadImage(
                    with: product.previewImageURL,
                    into: cell.previewImageView
                )

            } else {

                // Todo: add loading cell animation
                cell.contentView.backgroundColor = .gray

            }

        }

        return cell

    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch state {

        case .preparing:

            break

        case .ready:

            let isFetched = indexPath.row < provider.numberOfProducts

            if isFetched {

                let product = provider.product(at: indexPath)

                guard
                    let token = UserManager.shared.appToken
                    else {

                        // todo: error handling

                        return

                    }

                // todo: loading indicator
                let client = APIClient()

                client.sessionManager.adapter = AccessTokenAdapter(token: token)

                // todo: maybe cache the user object
                client.readMe(
                    success: { buyer in

                        let checkoutViewController = CheckoutViewController(
                            items: [ product ],
                            country: Taiwan(),
                            buyer: buyer
                        )

                        checkoutViewController.hidesBottomBarWhenPushed = true

                        // Todo: should show product detail firstly
                        self.navigationController?.pushViewController(checkoutViewController, animated: true)

                    },
                    failure: { error in

                        print("\(error)")

                        // Todo: error handling

                    }
                )

            }

        }

    }

    // MARK: ProductProviderDelegate

    func didFetch(by provider: ProductProvider) {

        state = .ready

        delegate?.controller(self, didChange: state)

    }

    func didFail(with error: Error, by provider: ProductProvider) {

        let alert = UIAlertController(
            title: nil,
            message: error.localizedDescription,
            preferredStyle: .alert
        )

        let ok = UIAlertAction(
            title: NSLocalizedString("OK", comment: ""),
            style: .cancel,
            handler: nil
        )

        alert.addAction(ok)

        present(alert, animated: true, completion: nil)

        delegate?.controller(self, didFailWith: error)

    }

    // MARK: UITableViewDataSourcePrefetching

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {

        switch state {

        case .preparing:

            break

        case .ready:

            if !provider.hasMoreProducts { return }

            provider.fetch()

        }

    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {

    }

}
