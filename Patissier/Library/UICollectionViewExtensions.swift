//
//  UICollectionViewExtensions.swift
//  TinyWorld
//
//  Created by Roy Hsu on 27/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - UICollectionViewExtensions

import UIKit

extension UICollectionView {

    // MARK: Register Identifiable Cell

    /// If the cell is built from the UINib, you should pass the bundle contains the Nib file as arguements.
    func register<C: UICollectionViewCell>(_ cellType: C.Type, withNibIn bundle: Bundle? = nil) where C: Identifiable {

        let identifier = cellType.identifier

        if let bundle = bundle {

            let nib = UINib(
                nibName: identifier,
                bundle: bundle
            )

            register(
                nib,
                forCellWithReuseIdentifier: identifier
            )

        } else {

            register(
                C.self,
                forCellWithReuseIdentifier: identifier
            )

        }

    }

}
