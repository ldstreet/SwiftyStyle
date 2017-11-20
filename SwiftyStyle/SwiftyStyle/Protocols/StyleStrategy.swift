//
//  StyleStrategy.swift
//  SwiftyStyle
//
//  Created by Luke Street on 10/29/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

/**
 Conform to style strategy to define how your UI controls should retrieve their style sets. This could
*/
public protocol StyleStrategy {
    
    /**
     Defines how to retrieve a StyleSet using a styleKey. i.e. retrieve from plist, json, user defaults, programmatic definition. Source of style sets could be included at compile time or downloaded at run time, or updated dynamically throughout lifecycle of app.
    */
    static func retrieveStyleSet(forStyleKey styleKey: String) -> StyleSet?
    
}

extension StyleStrategy {
    
    /**
     Useful function for transforming a dictionary into a StyleSet.
     
     - Parameter properties: [String: Any] containing all property keys -> values
     - Parameter ColorSetType: Optional. If set contains any colors that need to be transformed from String -> UIColor, use a type implementing ColorSetProtocol to perform the conversion
     - Parameter FontSetType: Optional. If set contains any fonts that need to be transformed from String -> UIFont, use a type implementing FontSetProtocol to perform the conversion
     - Returns: A style set converted from dictionary
    */
    public static func transformDictionaryOfPropertiesIntoStyleSet(properties: [String: Any], ColorSetType: ColorSetProtocol.Type? = nil, FontSetType: FontSetProtocol.Type? = nil) -> StyleSet {
        let transformedProps =  properties.mapValues({ value -> Any in
            if let str = value as? String {
                if let c = ColorSetType?.init(rawValue: str) {
                    return c.color
                }
                if let f = FontSetType?.init(rawValue: str) {
                    return f.font
                }
            }
            return value
        })
        
        let styleSet = StyleSet(properties: transformedProps)
        return styleSet
    }
}
