//
//  UICollectionViewExtensionsTests.swift
//  TinyWorld
//
//  Created by Roy Hsu on 27/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - TestCollectionViewCell

import UIKit

@testable import Patissier

class TestCollectionViewCell: UICollectionViewCell, Identifiable {

}

// MARK: - UICollectionViewExtensionsTests

import XCTest

class UICollectionViewExtensionsTests: XCTestCase {

    // MARK: Property

    var collectionView: UICollectionView?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout()
        )

    }

    override func tearDown() {

        collectionView = nil

        super.tearDown()
    }

    // MARK: Register Identifiable Cell Class

    func testRegisterIdentifiableCollectionViewCell() {

        collectionView!.register(
            TestCollectionViewCell.self,
            withNibIn: nil
        )

        // todo: subclassing UICollectionViewController to test
//        
//        let indexPath = IndexPath(row: 0, section: 0)
//        
//        let cell = collectionView!.dequeueReusableCell(
//            withReuseIdentifier: "TestCollectionViewCell",
//            for: indexPath
//        )
//        
//        XCTAssertNotNil(cell)

    }

    func testRegisterIdentifiableNibCollectionViewCell() {

        collectionView!.register(
            TestNibCollectionViewCell.self,
            withNibIn: Bundle(for: classForCoder)
        )

        // todo: subclassing UICollectionViewController to test
//        let indexPath = IndexPath(row: 0, section: 0)
//        
//        let cell = collectionView!.dequeueReusableCell(
//            withReuseIdentifier: "TestNibCollectionViewCell",
//            for: indexPath
//        )
//        
//        XCTAssertNotNil(cell)

    }

}
