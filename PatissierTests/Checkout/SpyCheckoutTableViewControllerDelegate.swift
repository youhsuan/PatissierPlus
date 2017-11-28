//
//  SpyCheckoutTableViewControllerDelegate.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - SpyCheckoutTableViewControllerDelegate

@testable import Patissier

class SpyCheckoutTableViewControllerDelegate<C>: CheckoutTableViewControllerDelegate where
    C: City, C.RawValue == String {

    // MARK: Property

    let didChangeForm: (_ form: CheckoutForm<C>) -> Void

    // MARK: Init

    init(didChangeForm: @escaping (_ form: CheckoutForm<C>) -> Void) {

        self.didChangeForm = didChangeForm

    }

    // Todo: fix failed to forward delegae because of generic
    func controler<C>(_ controller: CheckoutTableViewController<C>, didChange form: CheckoutForm<C>) where C: City, C.RawValue == String {

//        didChangeForm(
//            CheckoutForm(
//                city: form.city,
//                postalCode: form.postalCode,
//                address: form.address
//            )
//        )

    }

}
