//
//  HTTPClient.swift
//  Patissier
//
//  Created by WU CHIH WEI on 2017/11/2.
//  Copyright © 2017年 TinyWorld. All rights reserved.
//

// MARK: - HTTPResult

public enum HTTPResult {

    case success(Data)

    case failure(Error)

}

// MARK: - HTTPClient

import Foundation

public protocol HTTPClient {

    // MARK: Request

    func request(
        _ request: URLRequest,
        completion: @escaping (_ result: HTTPResult) -> Void
    )

}
