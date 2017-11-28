//
//  ProductGridCollectionViewLayoutFactory.swift
//  Patissier
//
//  Created by Roy Hsu on 02/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductGridCollectionViewLayoutFactory

import UIKit

struct ProductGridCollectionViewLayoutFactory {

    typealias Factory = ProductGridCollectionViewLayoutFactory

    // MARK: LayoutError

    enum LayoutError: Error, CustomStringConvertible {

        case widthAtLeast(CGFloat)

        var description: String {

            switch self {

            case .widthAtLeast(let minimumWidth):

                return "The width should be greater than or equal to \(minimumWidth) to fit the minimum layout requirement."

            }

        }

    }

    // MARK: Property

    let width: CGFloat

    var numberOfColumns: Int {

        let minimumWidth = Factory.minimumItemSize.width

        return Int(width / minimumWidth)

    }

    // Todo: Better to fix the bottom size of product info and scale preview image only when resizing cells
    // Todo: Better to fix small screen only shows one column of products. ex: 5s
    static let minimumItemSize = CGSize(width: 154.0, height: 160.0)

    static let itemMargin: CGFloat = 20.0

    // MARK: Init

    init(width: CGFloat) throws {

        try Factory.validateWidth(width)

        self.width = width

    }

    // MARK: Layout

    func makeLayout() throws -> UICollectionViewFlowLayout {

        try Factory.validateWidth(width)

        let numberOfMargins = numberOfColumns + 1

        let itemMargin = Factory.itemMargin

        let minimumItemSize = Factory.minimumItemSize

        let totalItemsMargin =
            itemMargin *
            CGFloat(numberOfMargins)

        let averageItemWidth =
            (width - totalItemsMargin) /
            CGFloat(numberOfColumns)

        let itemWidth =
            (averageItemWidth > minimumItemSize.width) ?
            averageItemWidth :
            minimumItemSize.width

        let itemHeight =
            itemWidth /
            (minimumItemSize.width / minimumItemSize.height)

        let layout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsets(
            top: itemMargin,
            left: itemMargin,
            bottom: itemMargin,
            right: itemMargin
        )

        layout.scrollDirection = .vertical

        layout.itemSize = CGSize(
            width: itemWidth,
            height: itemHeight
        )

        layout.minimumInteritemSpacing = itemMargin

        layout.minimumLineSpacing = itemMargin

        return layout

    }

    // MARK: Validation

    private static func validateWidth(_ width: CGFloat) throws {

        let minimumWidth = Factory.minimumItemSize.width

        guard width >= minimumWidth else {

            throw LayoutError.widthAtLeast(minimumWidth)

        }

    }

}
