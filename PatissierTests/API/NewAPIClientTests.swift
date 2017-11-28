//
//  NewAPIClientTests.swift
//  PatissierTests
//
//  Created by WU CHIH WEI on 2017/11/6.
//  Copyright © 2017年 TinyWorld. All rights reserved.
//

import XCTest

@testable import Patissier

internal final class NewAPIClientTests: XCTestCase {

    internal final func testSignInWithFacebook() {

        let expectation = XCTestExpectation(description: "Sign in with facebook")

        // swiftlint:disable nesting
        struct StubData {

            let tokenType: String

            let token: String

            let facebookAccessToken: String

        }
        // swiftlint:enable nesting

        let stubData = StubData(
            tokenType: "baerer",
            token: "1234",
            facebookAccessToken: "facebook1234"
        )

        let tokenJSON: [String: Any] = [
            "data": [
                "token_type": stubData.tokenType,
                "token": stubData.token
            ]
        ]

        do {

            let data = try JSONSerialization.data(withJSONObject: tokenJSON)

            let stubHTTPResult = HTTPResult.success(data)

            let userAPIClient = NewAPIClient(
                router: Router.signInFacebook(token: stubData.facebookAccessToken),
                httpClient: StubHTTPClient(stubHTTPResult: stubHTTPResult)
            )

            userAPIClient.signInWithFacebook(
                token: stubData.facebookAccessToken,
                success: { appToken in

                    expectation.fulfill()

                    XCTAssertEqual(
                        appToken.tokenString,
                        stubData.token
                    )

                    XCTAssertEqual(
                        appToken.tokenType.rawValue,
                        stubData.tokenType
                    )

                },
                failure: { error in

                    expectation.fulfill()

                    XCTFail("\(error)")

                }
            )
        }
        catch {

            expectation.fulfill()

            XCTFail("\(error)")

        }

        wait(
            for: [expectation],
            timeout: 10.0
        )

    }

    internal final func testFailToSignInWithFacebook() {

        let exception = XCTestExpectation(description: "Fail to sign in with facebook.")

        // swiftlint:disable nesting
        struct StubData {

            let facebookToken: String

        }
        // swiftlint:enable nesting

        let stubHTTPClient = StubHTTPClient(
            stubHTTPResult: HTTPResult.failure(StubHTTPError.stubError)
        )

        let stubData = StubData(facebookToken: "facebook1234")

        let userAPIClient = NewAPIClient(
            router: Router.signInFacebook(token: stubData.facebookToken),
            httpClient: stubHTTPClient
        )

        userAPIClient.signInWithFacebook(
            token: stubData.facebookToken,
            success: { _ in

                exception.fulfill()

                XCTFail("Success handler should not be excuted.")

            },
            failure: { error in

                exception.fulfill()

                guard
                    let error = error as? StubHTTPError
                else {

                        XCTFail("Error should be StubHTTPError.")

                        return
                }

                XCTAssertEqual(
                    error,
                    StubHTTPError.stubError
                )

            }
        )

        wait(
            for: [ exception ],
            timeout: 10.0
        )

    }

    internal final func testReadMe() {

        // swiftlint:disable nesting
        struct StubData {

            let user: User

        }
        // swiftlint:enable nesting

        let stubData = StubData(
            user: User(
                id: "12345",
                name: "Luke",
                firstName: "Chih Wei",
                lastName: "Wu"
            )
        )

        let stubJSON = [
            "data": [
                "id": stubData.user.id,
                "name": stubData.user.name,
                "firstName": stubData.user.firstName,
                "lastName": stubData.user.lastName
            ]
        ]

        let exception = XCTestExpectation(description: "Read me.")

        do {

            let data = try JSONSerialization.data(
                withJSONObject: stubJSON,
                options: [.prettyPrinted]
            )

            let stubHTTPClient = StubHTTPClient(
                stubHTTPResult: HTTPResult.success(data)
            )

            let userAPIClient = NewAPIClient(
                router: Router.readMe,
                httpClient: stubHTTPClient
            )

            userAPIClient.readMe(
                success: { user in

                    exception.fulfill()

                    XCTAssertEqual(stubData.user, user)

                },
                failure: { error in

                    exception.fulfill()

                    XCTFail("\(error)")

                }
            )

        }
        catch {

            exception.fulfill()

            XCTFail("\(error)")

        }

        wait(
            for: [ exception ],
            timeout: 10.0
        )

    }

    internal final func testFailToReadMe() {

        let stubHTTPClient = StubHTTPClient(
            stubHTTPResult: HTTPResult.failure(StubHTTPError.stubError)
        )

        let userAPIClient = NewAPIClient(
            router: Router.readMe,
            httpClient: stubHTTPClient
        )

        let exception = XCTestExpectation(description: "Fail to read me.")

        userAPIClient.readMe(
            success: { _ in

                exception.fulfill()

                XCTFail("Success should not be excuted in fail to read me test case")

            },
            failure: { error in

                exception.fulfill()

                guard
                    let error = error as? StubHTTPError
                else {

                    XCTFail("Error should be StubHTTPError.")

                    return

                }

                XCTAssertEqual(
                    error,
                    StubHTTPError.stubError
                )

            }
        )

        wait(
            for: [ exception ],
            timeout: 10.0
        )

    }

}
