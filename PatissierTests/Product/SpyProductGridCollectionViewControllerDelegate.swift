//
//  SpyProductGridCollectionViewControllerDelegate.swift
//  Patissier
//
//  Created by Roy Hsu on 06/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

@testable import Patissier

// swiftlint:disable type_name
class SpyProductGridCollectionViewControllerDelegate: ProductGridCollectionViewControllerDelegate {
// swiftlint:enable type_name

    typealias State = ProductGridCollectionViewController.State

    typealias DidChange = (State) -> Void

    typealias DidFail = (_ error: Error) -> Void

    // MARK: Property

    let didChange: DidChange

    let didFail: DidFail

    // MARK: Init

    init(didChange: @escaping DidChange, didFail: @escaping DidFail) {

        self.didChange = didChange

        self.didFail = didFail

    }

    // MARK: ProductGridCollectionViewControllerDelegate

    func controller(_ controller: ProductGridCollectionViewController, didChange state: State) {

        didChange(state)

    }

    func controller(_ controller: ProductGridCollectionViewController, didFailWith error: Error) {

        didFail(error)

    }

}
