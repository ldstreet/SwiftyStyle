//
//  StyleKeyProtocol.swift
//  SwiftyStyle
//
//  Created by Luke Street on 3/16/18.
//  Copyright © 2018 com.ldstreet. All rights reserved.
//

import Foundation

/**
 Best used with string based enums, conform to this protocol in order to define style keys
 */
public protocol StyleKeyProtocol {
    var rawValue: String { get }
}

extension String: StyleKeyProtocol {}
