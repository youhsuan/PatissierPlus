//
//  CheckoutTableViewControllerTests.swift
//  Patissier
//
//  Created by Roy Hsu on 09/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - CheckoutTableViewControllerTests

import XCTest

@testable import Patissier

class CheckoutTableViewControllerTests: XCTestCase {

    // MARK: Property

    var controller: CheckoutTableViewController<TaiwanCity>?

    // MARK: Set Up

    override func setUp() {
        super.setUp()

//        controller = CheckoutTableViewController()
//
//        controller!.loadView()
//
//        controller!.viewDidLoad()
//
//        controller!.view.layoutIfNeeded()

    }

    override func tearDown() {

        controller = nil

        super.tearDown()
    }

    // MARK: Component

    func testComponents() {

//        XCTAssertEqual(
//            controller!.components,
//            [ .item, .shipping, .recipient, .payment ]
//        )

    }

    // MARK: Table View Data Source

    func testTableDataSource() {

//        let components = controller!.components
//
//        let tableView = controller!.tableView!
//
//        XCTAssertEqual(
//            tableView.numberOfSections,
//            components.count
//        )
//
//        let itemSection = components.index(of: .item)!
//
//        XCTAssertEqual(
//            tableView.numberOfRows(
//                inSection: itemSection
//            ),
//            1
//        )
//
//        let itemCell = tableView.dequeueReusableCell(
//            withIdentifier: "CheckoutItemTableViewCell",
//            for: IndexPath(row: 0, section: itemSection)
//        ) as? CheckoutItemTableViewCell
//
//        XCTAssertNotNil(itemCell)
//
//        let shippingSection = components.index(of: .shipping)!
//
//        XCTAssertEqual(
//            tableView.numberOfRows(
//                inSection: shippingSection
//            ),
//            1
//        )
//
//        let shippingCell = tableView.dequeueReusableCell(
//            withIdentifier: "CheckoutShippingTableViewCell",
//            for: IndexPath(row: 0, section: shippingSection)
//        ) as? CheckoutShippingTableViewCell
//
//        XCTAssertNotNil(shippingCell)
//
//        let recipientSection = components.index(of: .recipient)!
//
//        XCTAssertEqual(
//            tableView.numberOfRows(
//                inSection: recipientSection
//            ),
//            1
//        )
//
//        let recipientCell = tableView.dequeueReusableCell(
//            withIdentifier: "CheckoutRecipientTableViewCell",
//            for: IndexPath(row: 0, section: recipientSection)
//        ) as? CheckoutRecipientTableViewCell
//
//        XCTAssertNotNil(recipientCell)
//
//        let paymentSection = components.index(of: .payment)!
//
//        XCTAssertEqual(
//            tableView.numberOfRows(
//                inSection: paymentSection
//            ),
//            1
//        )
//
//        let paymentCell = tableView.dequeueReusableCell(
//            withIdentifier: "CheckoutPaymentTableViewCell",
//            for: IndexPath(row: 0, section: paymentSection)
//        ) as? CheckoutPaymentTableViewCell
//
//        XCTAssertNotNil(paymentCell)

    }

    // MARK: CheckoutTableViewControllerDelegate

    func testDelegate() {

//        let promise = expectation(
//            description: "Observe shipping changes"
//        )
//        
//        let delegate = SpyCheckoutTableViewControllerDelegate<TaiwanCity>(
//            didChangeForm: { form in
//        
//                promise.fulfill()
//        
//            }
//        )
//        
//        controller!.delegate = delegate
//        
//        var newForm = controller!.form
//        
//        newForm.city = .taipei
//        
//        controller!.form = newForm
//        
//        waitForExpectations(timeout: 10.0)

    }

}
