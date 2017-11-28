//
//  ProfileInformationTableViewCell.swift
//  Patissier
//
//  Created by Roy Hsu on 27/08/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProfileInformationTableViewCell

import UIKit

class ProfileInformationTableViewCell: UITableViewCell {

    // MARK: Property

    @IBOutlet private weak var placeholderImageView: UIImageView!

    @IBOutlet private(set) weak var pictureImageView: UIImageView!

    @IBOutlet private weak var nameView: UIView!

    @IBOutlet private(set) weak var nameLabel: UILabel!

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpPlaceholderImageView()

        setUpPictureImageView()

        setUpNameView()

        setUpNameLabel()

    }

    // MARK: Set Up

    private func setUpPlaceholderImageView() {

        let imageView = placeholderImageView!

        imageView.backgroundColor = .white

        imageView.contentMode = .center

        imageView.image = #imageLiteral(resourceName: "icon-placeholder").withRenderingMode(.alwaysTemplate)

        imageView.tintColor = UIColor(
            red: 165.0 / 255.0,
            green: 170.0 / 255.0,
            blue: 178.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpPictureImageView() {

        let imageView = pictureImageView!

        imageView.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill

    }

    private func setUpNameView() {

        let view = nameView!

        view.backgroundColor = UIColor(
            red: 82.0 / 255.0,
            green: 66.0 / 255.0,
            blue: 64.0 / 255.0,
            alpha: 0.75
        )

    }

    private func setUpNameLabel() {

        let label = nameLabel!

        label.font = UIFont(name: "Georgia", size: 18.0)

        label.layer.shadowColor = UIColor.black.cgColor

        label.layer.shadowRadius = 2.0

        label.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        label.layer.shadowOpacity = 0.5

        label.text = nil

        label.textAlignment = .center

        label.textColor = .white

    }

}
