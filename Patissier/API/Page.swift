//
//  Page.swift
//  Patissier
//
//  Created by Roy Hsu on 08/07/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PageToken

protocol PageToken: Equatable {

    // MARK: Property

    associatedtype RawValue: ExpressibleByStringLiteral, Comparable

    var rawValue: RawValue { get }

}

// MARK: - PageToken: Equatable

extension PageToken {

    static func == (lhs: Self, rhs: Self) -> Bool {

        return lhs.rawValue == rhs.rawValue

    }

}

// MARK: - Page

enum Page<Token: PageToken> {

    case begin

    case next(Token)

    case end

}

// MARK: - Page: Equatable

extension Page: Equatable {

    static func == (lhs: Page, rhs: Page) -> Bool {

        switch (lhs, rhs) {

        case (.begin, .begin):

            return true

        case (.next(let lhsToken), .next(let rhsToken)):

            return lhsToken == rhsToken

        case (.end, .end):

            return true

        default:

            return false

        }

    }

}
