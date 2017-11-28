//
//  GradientNavigationControllerTests.swift
//  PatissierTests
//
//  Created by Roy Hsu on 22/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - GradientNavigationControllerTests

import XCTest

@testable import Patissier

class GradientNavigationControllerTests: XCTestCase {

    // MARK: Property

    var controller: GradientNavigationController?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        controller = GradientNavigationController(
            rootViewController: UIViewController()
        )

        controller!.loadView()

        controller!.viewDidLoad()

        controller!.view.layoutIfNeeded()

    }

    override func tearDown() {

        controller = nil

        XCUIDevice.shared.orientation = .portrait

        super.tearDown()
    }

    // MARK: Gradient Layer

    func testGradientLayer() {

        let gradientLayer = controller!.navigationBarGradientLayer

        let gradientColors = gradientLayer.colors as? [CGColor]

        XCTAssertNotNil(gradientColors)

        XCTAssertEqual(
            gradientColors!,
            [
                UIColor(red: 3.0 / 255.0, green: 63.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0).cgColor,
                UIColor(red: 4.0 / 255.0, green: 107.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0).cgColor
            ]
        )

        XCTAssertEqual(
            gradientLayer.startPoint,
            CGPoint(x: 0.0, y: 0.5)
        )

        XCTAssertEqual(
            gradientLayer.endPoint,
            CGPoint(x: 1.0, y: 0.5)
        )

        let navigationBar = controller!.navigationBar

        // Portrait mode

        func expectedGradientLayerFrame() -> CGRect {

            let expectedWidth = navigationBar.bounds.size.width

            let expectedHeight = navigationBar.frame.origin.y + navigationBar.bounds.size.height

            return CGRect(
                x: 0.0,
                y: 0.0,
                width: expectedWidth,
                height: expectedHeight
            )

        }

        XCTAssertEqual(
            gradientLayer.frame,
            expectedGradientLayerFrame()
        )

        // Landscape mode

        XCUIDevice.shared.orientation = .landscapeLeft

        controller!.view.layoutIfNeeded()

        XCTAssertEqual(
            gradientLayer.frame,
            expectedGradientLayerFrame()
        )

    }

}
