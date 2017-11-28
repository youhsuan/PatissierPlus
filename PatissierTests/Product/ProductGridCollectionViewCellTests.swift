//
//  ProductGridCollectionViewCellTests.swift
//  Patissier
//
//  Created by Roy Hsu on 27/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProductGridCollectionViewCellTests

import XCTest

@testable import Patissier

// swiftlint:disable type_body_length
class ProductGridCollectionViewCellTests: XCTestCase {
// swiftlint:enable type_body_length

    // MARK: Property

    var cell: ProductGridCollectionViewCell?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        cell = UINib.load(
            nibName: "ProductGridCollectionViewCell"
        ) as? ProductGridCollectionViewCell

        cell!.layoutIfNeeded()

    }

    override func tearDown() {

        cell = nil

        super.tearDown()
    }

    // MARK: UI Elements

    func testDetailView() {

        // MARK: Style

        let subview = cell!.detailView!

        XCTAssertEqual(
            subview.backgroundColor,
            .white
        )

        XCTAssertEqual(
            subview.layer.borderColor,
            UIColor(
                red: 74.0 / 255.0,
                green: 74.0 / 255.0,
                blue: 74.0 / 255.0,
                alpha: 1.0
            ).cgColor
        )

        XCTAssertEqual(
            subview.layer.borderWidth,
            0.2
        )

        XCTAssertEqual(
            subview.layer.cornerRadius,
            1.0
        )

        // MARK: Layout

        let rootView = cell!

        let absoluteSubviewFrame = rootView.convert(
            subview.frame,
            from: subview.superview!
        )

        let leading = absoluteSubviewFrame.origin.x

        XCTAssertEqual(
            leading,
            6.0
        )

        let top = absoluteSubviewFrame.origin.y

        XCTAssertEqual(
            top,
            0.0
        )

        let trailing = rootView.bounds.width - absoluteSubviewFrame.maxX

        XCTAssertEqual(
            trailing,
            6.0
        )

        let bottom = rootView.bounds.height - absoluteSubviewFrame.maxY

        XCTAssert(
            (1.3...1.7).contains(Double(bottom)) // ~= 1.5
        )

    }

    func testLikeButton() {

        // Style

        let button = cell!.likeButton!

        XCTAssertEqual(
            button.layer.borderColor,
            UIColor(
                red: 165.0 / 255.0,
                green: 170.0 / 255.0,
                blue: 178.0 / 255.0,
                alpha: 1.0
            ).cgColor
        )

        XCTAssertEqual(
            button.layer.borderWidth,
            0.2
        )

        XCTAssertEqual(
            button.layer.cornerRadius,
            4.0
        )

        XCTAssertEqual(
            button.title(for: .normal),
            nil
        )

        XCTAssertEqual(
            button.image(for: .normal),
            UIImage(named: "icon-heart")!
                .withRenderingMode(.alwaysTemplate)
        )

        XCTAssertEqual(
            button.tintColor,
            UIColor(
                red: 165.0 / 255.0,
                green: 170.0 / 255.0,
                blue: 178.0 / 255.0,
                alpha: 1.0
            )
        )

        // Layout

        let rootView = cell!

        let absoluteButtonFrame = rootView.convert(
            button.frame,
            from: button.superview!
        )

        let width = absoluteButtonFrame.width

        XCTAssertEqual(
            width,
            30.0
        )

        let height = absoluteButtonFrame.height

        XCTAssertEqual(
            height,
            20.0
        )

        let leading = absoluteButtonFrame.origin.x

        XCTAssertEqual(
            leading,
            14.0
        )

        let bottom = rootView.bounds.height - absoluteButtonFrame.maxY

        XCTAssertEqual(
            bottom,
            8.0
        )

    }

    func testPriceLabel() {

        // Style

        let label = cell!.priceLabel!

        XCTAssertEqual(
            label.font,
            UIFont(name: "LuxiMono", size: 12.0)
        )

        XCTAssertEqual(
            label.numberOfLines,
            1
        )

        XCTAssertEqual(
            label.text,
            nil
        )

        XCTAssertEqual(
            label.textAlignment,
            .right
        )

        XCTAssertEqual(
            label.textColor,
            UIColor(
                red: 82.0 / 255.0,
                green: 66.0 / 255.0,
                blue: 64.0 / 255.0,
                alpha: 1.0
            )
        )

        // Layout

        let rootView = cell!

        let absoluteLabelFrame = rootView.convert(
            label.frame,
            from: label.superview!
        )

        let likeButton = cell!.likeButton!

        let absoluteLikeButtonFrame = rootView.convert(
            likeButton.frame,
            from: likeButton.superview!
        )

        let leading = absoluteLabelFrame.origin.x - absoluteLikeButtonFrame.maxX

        XCTAssertEqual(
            leading,
            4.0
        )

        let trailing = rootView.bounds.width - absoluteLabelFrame.maxX

        XCTAssertEqual(
            trailing,
            14.0
        )

        XCTAssertEqual(
            label.center.y,
            likeButton.center.y
        )

    }

    func testTitleLabel() {

        // Style

        let label = cell!.titleLabel!

        XCTAssertEqual(
            label.font,
            UIFont(name: "Georgia", size: 14.0)
        )

        XCTAssertEqual(
            label.numberOfLines,
            1
        )

        XCTAssertEqual(
            label.text,
            nil
        )

        XCTAssertEqual(
            label.textAlignment,
            .left
        )

        XCTAssertEqual(
            label.textColor,
            UIColor(
                red: 82.0 / 255.0,
                green: 66.0 / 255.0,
                blue: 64.0 / 255.0,
                alpha: 1.0
            )
        )

        // Layout

        let rootView = cell!

        let absoluteLabelFrame = rootView.convert(
            label.frame,
            from: label.superview!
        )

        let placeholderImageView = cell!.placeholderImageView!

        let absolutePlaceholderImageViewFrame = rootView.convert(
            placeholderImageView.frame,
            from: placeholderImageView.superview!
        )

        let likeButton = cell!.likeButton!

        let absoluteLikeButton = rootView.convert(
            likeButton.frame,
            from: likeButton.superview!
        )

        let leading = absoluteLabelFrame.origin.x

        XCTAssertEqual(
            leading,
            14.0
        )

        let top = absoluteLabelFrame.origin.y - absolutePlaceholderImageViewFrame.maxY

        XCTAssertEqual(
            top,
            8.0
        )

        let trailing = rootView.bounds.width - absoluteLabelFrame.maxX

        XCTAssertEqual(
            trailing,
            14.0
        )

        let bottom = absoluteLikeButton.origin.y - absoluteLabelFrame.maxY

        XCTAssertEqual(
            bottom,
            8.0
        )

    }

    func testPlaceholderImageView() {

        // Style

        let imageView = cell!.placeholderImageView!

        imageView.backgroundColor = .white

        XCTAssertEqual(
            imageView.contentMode,
            .center
        )

        XCTAssertEqual(
            imageView.layer.shadowColor,
            UIColor.black.cgColor
        )

        XCTAssertEqual(
            imageView.layer.shadowRadius,
            1.0
        )

        XCTAssertEqual(
            imageView.layer.shadowOffset,
            CGSize(width: 0.0, height: 1.0)
        )

        XCTAssertEqual(
            imageView.layer.shadowOpacity,
            0.26
        )

        XCTAssertEqual(
            imageView.image,
            UIImage(named: "icon-placeholder")!
                .withRenderingMode(.alwaysTemplate)
        )

        XCTAssertEqual(
            imageView.tintColor,
            UIColor(
                red: 165.0 / 255.0,
                green: 170.0 / 255.0,
                blue: 178.0 / 255.0,
                alpha: 1.0
            )
        )

        // Layout

        let rootView = cell!

        let absoluteImageViewFrame = rootView.convert(
            imageView.frame,
            from: imageView.superview!
        )

        let horiztonalMargin: CGFloat = 2.0

        let leading = absoluteImageViewFrame.origin.x

        XCTAssertEqual(
            leading,
            horiztonalMargin
        )

        let top = absoluteImageViewFrame.origin.y

        XCTAssertEqual(
            top,
            0.0
        )

        let expectedWidth = rootView.bounds.width - (horiztonalMargin * 2)

        XCTAssertEqual(
            absoluteImageViewFrame.width,
            expectedWidth
        )

        let expectedAspectRatio: CGFloat = 150.0 / 100.0

        XCTAssertEqual(
            absoluteImageViewFrame.width / absoluteImageViewFrame.height,
            expectedAspectRatio
        )

        let expectedHeight = absoluteImageViewFrame.width / expectedAspectRatio

        XCTAssertEqual(
            absoluteImageViewFrame.height,
            expectedHeight
        )

    }

    func testPreviewImageView() {

        // Style

        let imageView = cell!.previewImageView!

        XCTAssertEqual(
            imageView.clipsToBounds,
            true
        )

        XCTAssertEqual(
            imageView.contentMode,
            .scaleAspectFill
        )

        // Layout

        let placeholderImageView = cell!.placeholderImageView!

        XCTAssertEqual(
            imageView.frame,
            placeholderImageView.frame
        )

    }

    func testIsLike() {

        let button = cell!.likeButton!

        XCTAssertFalse(cell!.isLiked)

        cell!.isLiked = true

        XCTAssertEqual(
            button.tintColor,
            UIColor(
                red: 255.0 / 255.0,
                green: 53.0 / 255.0,
                blue: 71.0 / 255.0,
                alpha: 1.0
            )
        )

        XCTAssertEqual(
            button.layer.borderColor,
            UIColor(
                red: 255.0 / 255.0,
                green: 53.0 / 255.0,
                blue: 71.0 / 255.0,
                alpha: 1.0
            ).cgColor
        )

        cell!.isLiked = false

        XCTAssertEqual(
            button.tintColor,
            UIColor(
                red: 165.0 / 255.0,
                green: 170.0 / 255.0,
                blue: 178.0 / 255.0,
                alpha: 1.0
            )
        )

        XCTAssertEqual(
            button.layer.borderColor,
            UIColor(
                red: 165.0 / 255.0,
                green: 170.0 / 255.0,
                blue: 178.0 / 255.0,
                alpha: 1.0
            ).cgColor
        )

    }

}
