//
//  StubHTTPClient.swift
//  PatissierTests
//
//  Created by WU CHIH WEI on 2017/11/9.
//  Copyright © 2017年 TinyWorld. All rights reserved.
//

import Foundation

@testable import Patissier

internal struct StubHTTPClient: HTTPClient {

    internal let stubHTTPResult: HTTPResult

    internal func request(
        _ request: URLRequest,
        completion: @escaping (_ result: HTTPResult) -> Void
    ) { completion(self.stubHTTPResult) }

}

enum StubHTTPError: Error {

    case stubError

}

extension StubHTTPError: Equatable {

    // swiftlint:disable operator_whitespace

    static func ==(lhs: StubHTTPError, rhs: StubHTTPError) -> Bool {

        switch (lhs, rhs) {

        case (.stubError, .stubError):

            return true

        }

    }

    // swiftlint:enable operator_whitespace

}
