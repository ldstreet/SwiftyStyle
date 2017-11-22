//
//  SwiftyStyleProtocol.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/12/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

/**
 Conform to this protocol to define how a control should be styled given a key and a StyleSet
 */
public protocol SwiftyStyleProtocol: class {
    
    /**
     Defines how a control should be styled with a given styleSet. Most standard iOS controls should be defined inside the Swifty Style framework so this will mostly be used for custom controls.
    */
    func style(styleSet: StyleSet)
    
    /**
     Defines how a style can be retrieved given a key. If control also conforms to SwiftyStyleSetRetrieverProtocol, then there is no need to implement style(as key: String)
    */
    func style(as key: String)
    
}

extension SwiftyStyleProtocol where Self: SwiftyStyleInfoProtocol {
    
    /**
     Wraps style(as key: String), conrol must conform to SwiftyStyleInfoProtocol in order to style using styleKey
    */
    public func style() {
        style(as: styleKey ?? "No style key")
    }
    
}

extension SwiftyStyleProtocol where Self: SwiftyStyleSetRetrieverProtocol {
    
    /**
     Default implementation for style(as key: String) when control also conforms to SwiftyStyleSetRetrieverProtocol. Uses given key to attempt to retrieve styleSet as defined by protocol. After styling with retrieved set, do any additional styling if control conforms to SwiftyAdditionalStyleProtocol
    */
    public func style(as key: String) {
        
        if let set = styleSet(key: key) {
            
            self.style(styleSet: set)
            
            //Any additional styling needed that is not included in base layer.
            (self as? SwiftyAdditionalStyleProtocol)?.additionalStyle(styleSet: set)
            
        } else {
            print("Could not retrieve styleSet for \(String(describing: Self.self)), make sure styleKey has been set.")
        }
    }
    
}
