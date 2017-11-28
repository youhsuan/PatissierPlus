//
//  LandingViewControllerTests.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LandingViewControllerTests

import XCTest

@testable import Patissier

class LandingViewControllerTests: XCTestCase {

    // MARK: Property

    var controller: LandingViewController?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        controller = UIViewController.load(
            LandingViewController.self,
            from: .landing
        )

        controller!.loadView()

        controller!.viewDidLoad()

        controller!.view.layoutIfNeeded()

    }

    override func tearDown() {

        controller = nil

        super.tearDown()
    }

    // MARK: UI

    func testHiddenStatusBar() {

        XCTAssert(controller!.prefersStatusBarHidden)

    }

    func testBackgroundImageView() {

        // Style

        let imageView = controller!.backgroundImageView!

        XCTAssertEqual(
            imageView.contentMode,
            .scaleAspectFill
        )

        XCTAssertEqual(
            imageView.image,
            UIImage(named: "image-landing")
        )

        // Layout

        XCTAssertEqual(
            imageView.frame,
            controller!.view.bounds
        )

    }

    func testBackgroundGradientView() {

        // Style

        let alpha = controller!.backgroundGradientView.alpha

        let scale: CGFloat = 100.0

        XCTAssertEqual(
            Int(alpha * scale),
            Int(0.85 * scale)
        )

        let layer = controller!.backgroundGradientLayer

        let colors = layer.colors as? [CGColor]

        XCTAssertNotNil(colors)

        XCTAssertEqual(
            colors!,
            [
                UIColor(red: 3.0 / 255.0, green: 63.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0).cgColor,
                UIColor(red: 4.0 / 255.0, green: 107.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0).cgColor
            ]
        )

        XCTAssertEqual(
            layer.endPoint,
            CGPoint(x: 0.5, y: 1.0)
        )

        XCTAssertEqual(
            layer.startPoint,
            CGPoint(x: 0.5, y: 0.0)
        )

        // Layout

        XCTAssertEqual(
            layer.frame,
            controller!.view.bounds
        )

    }

    func testLogoLabel() {

        // Style

        let label = controller!.logoLabel!

        XCTAssertEqual(
            label.font,
            UIFont(name: "Georgia-Bold", size: 50.0)
        )

        XCTAssertEqual(
            label.text,
            NSLocalizedString("Pâtissier", comment: "")
        )

        XCTAssertEqual(
            label.textAlignment,
            .center
        )

        XCTAssertEqual(
            label.textColor,
            .white
        )

        XCTAssertEqual(
            label.layer.shadowColor,
            UIColor.black.cgColor
        )

        XCTAssertEqual(
            label.layer.shadowOffset,
            CGSize(width: 0.0, height: 1.0)
        )

        XCTAssertEqual(
            label.layer.shadowOpacity,
            0.5
        )

        XCTAssertEqual(
            label.layer.shadowRadius,
            2.0
        )

        // Layout

        let superview = label.superview!

        XCTAssertEqual(
            label.center.x,
            superview.center.x
        )

        let leading = label.frame.origin.x

        XCTAssertEqual(
            leading,
            superview.layoutMargins.left
        )

        let trailing = superview.bounds.size.width - label.frame.maxX

        XCTAssertEqual(
            trailing,
            superview.layoutMargins.right
        )

        let top = label.frame.origin.y

        let topRatio = top / superview.bounds.size.height

        let scale: CGFloat = 1000.0

        XCTAssertEqual(
            Int(topRatio * scale),
            Int(115.0 / 667.0 * scale)
        )

    }

    func testSignInWithFacebookButton() {

        // Style

        let button = controller!.signInWithFacebookButton!

        XCTAssertEqual(
            button.backgroundColor,
            UIColor(
                red: 255.0 / 255.0,
                green: 53.0 / 255.0,
                blue: 71.0 / 255.0,
                alpha: 1.0
            )
        )

        XCTAssertEqual(
            button.contentEdgeInsets,
            UIEdgeInsets(
                top: 12.0,
                left: 10.0,
                bottom: 12.0,
                right: 10.0
            )
        )

        XCTAssertEqual(
            button.titleLabel!.font,
            UIFont.systemFont(
                ofSize: 16.0,
                weight: UIFont.Weight.semibold
            )
        )

        XCTAssertEqual(
            button.title(for: .normal),
            NSLocalizedString("Sign In with Facebook", comment: "")
        )

        XCTAssertEqual(
            button.titleColor(for: .normal),
            .white
        )

        XCTAssertEqual(
            button.layer.cornerRadius,
            2.0
        )

        XCTAssertEqual(
            button.layer.shadowColor,
            UIColor(
                red: 3.0 / 255.0,
                green: 63.0 / 255.0,
                blue: 122.0 / 255.0,
                alpha: 1.0
            )
            .cgColor
        )

        XCTAssertEqual(
            button.layer.shadowOffset,
            CGSize(width: 0.0, height: 1.0)
        )

        XCTAssertEqual(
            button.layer.shadowOpacity,
            1.0
        )

        XCTAssertEqual(
            button.layer.shadowRadius,
            10.0
        )

        // MARK: Layout

        let superview = button.superview!

        button.layoutIfNeeded()

        XCTAssertEqual(
            button.center.x,
            superview.center.x
        )

        let leading = button.frame.origin.x

        XCTAssertGreaterThanOrEqual(
            leading,
            superview.layoutMargins.left
        )

        let trailing = superview.bounds.size.width - button.frame.maxX

        XCTAssertGreaterThanOrEqual(
            trailing,
            superview.layoutMargins.right
        )

        let bottom = superview.bounds.size.height - button.frame.maxY

        let bottomRatio = bottom / superview.bounds.size.height

        let scale: CGFloat = 1000.0

        XCTAssertEqual(
            Int(bottomRatio * scale),
            Int(100.0 / 667.0 * scale)
        )

    }

    // MARK: Action

    func testSignInWithFacebookAction() {

        let didRespond = controller!.responds(
            to: #selector(controller!.signInWithFacebook)
        )

        XCTAssert(didRespond)

    }

}
