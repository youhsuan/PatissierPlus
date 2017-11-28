//
//  UINibExtensions.swift
//  TinyWorld
//
//  Created by Roy Hsu on 27/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - UINibExtensions

import UIKit

public extension UINib {

    /**
     A convenience method loads a local xib file.
     
     - Author: Roy Hsu
     
     - Parameter nibName: The name of xib file.
     
     - Parameter bundle: The bundle xib file located. Default is nil.
     
     - Returns: The loaded instance.
     */

    public class func load(nibName name: String, bundle: Bundle? = nil) -> Any? {

        return UINib(nibName: name, bundle: bundle)
            .instantiate(withOwner: nil, options: nil)
            .first

    }

}
