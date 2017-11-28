//
//  ProductGridCollectionViewCell.swift
//  Patissier
//
//  Created by Roy Hsu on 27/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductGridCollectionViewCellTests

import UIKit

class ProductGridCollectionViewCell: UICollectionViewCell, Identifiable {

    // MARK: Property

    @IBOutlet private(set) weak var detailView: UIView!

    @IBOutlet private(set) weak var likeButton: UIButton!

    @IBOutlet private(set) weak var placeholderImageView: UIImageView!

    @IBOutlet private(set) weak var previewImageView: UIImageView!

    @IBOutlet private(set) weak var priceLabel: UILabel!

    @IBOutlet private(set) weak var titleLabel: UILabel!

    var isLiked = false {

        didSet {

            let gray = UIColor(
                red: 165.0 / 255.0,
                green: 170.0 / 255.0,
                blue: 178.0 / 255.0,
                alpha: 1.0
            )

            let red = UIColor(
                red: 255.0 / 255.0,
                green: 53.0 / 255.0,
                blue: 71.0 / 255.0,
                alpha: 1.0
            )

            likeButton.tintColor = isLiked ? red : gray

            likeButton.layer.borderColor = isLiked ? red.cgColor : gray.cgColor

        }

    }

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpDetailView()

        setUpLikeButton()

        setUpPlaceholderImageView()

        setUpPreviewImageView()

        setUpPriceLabel()

        setUpTitleLabel()

    }

    // MARK: Set Up

    private func setUpDetailView() {

        let subview = detailView!

        subview.backgroundColor = .white

        subview.layer.borderColor = UIColor(
            red: 74.0 / 255.0,
            green: 74.0 / 255.0,
            blue: 74.0 / 255.0,
            alpha: 1.0
        ).cgColor

        subview.layer.borderWidth = 0.2

        subview.layer.cornerRadius = 1.0

    }

    private func setUpLikeButton() {

        let button = likeButton!

        button.layer.borderColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        ).cgColor

        button.layer.borderWidth = 0.2

        button.layer.cornerRadius = 4.0

        button.setTitle(nil, for: .normal)

        let image = #imageLiteral(resourceName: "icon-heart").withRenderingMode(.alwaysTemplate)

        button.setImage(
            image,
            for: .normal
        )

        button.tintColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpPlaceholderImageView() {

        let imageView = placeholderImageView!

        imageView.backgroundColor = .white

        imageView.contentMode = .center

        imageView.layer.shadowColor = UIColor.black.cgColor

        imageView.layer.shadowRadius = 1.0

        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        imageView.layer.shadowOpacity = 0.26

        imageView.image = #imageLiteral(resourceName: "icon-placeholder").withRenderingMode(.alwaysTemplate)

        imageView.tintColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpPreviewImageView() {

        let imageView = previewImageView!

        imageView.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill

    }

    private func setUpPriceLabel() {

        let label = priceLabel!

        label.font = UIFont(name: "LuxiMono", size: 12.0)

        label.numberOfLines = 1

        label.text = nil

        label.textAlignment = .right

        label.textColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpTitleLabel() {

        let label = titleLabel!

        label.font = UIFont(name: "Georgia", size: 14.0)

        label.numberOfLines = 1

        label.text = nil

        label.textAlignment = .left

        label.textColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 1.0
        )

    }

}
