//
//  File.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/12/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

/**
 Conform to this protocol to set what strategy will be used to retrieve a style set
 */
public protocol SwiftyStyleSetRetrieverProtocol: class {
    
    /**
     Defines what strategy will be used to retrieve StyleSet. See StyleStrategy documentation.
    */
    associatedtype Strategy: StyleStrategy
    
}

extension SwiftyStyleSetRetrieverProtocol {
    
    /**
     Uses specified StyleStrategy to retrieve a StyleSet given a key.
    */
    public func styleSet(key: StyleKeyProtocol) -> StyleSet? {
        return Strategy.retrieveStyleSet(forStyleKey: key)
    }
    
}
