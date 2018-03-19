//
//  StyleStrategy.swift
//  SwiftyStyle
//
//  Created by Luke Street on 10/29/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

/**
 Conform to style strategy to define how your UI controls should retrieve their style sets.
*/
public protocol StyleStrategy {
    
    /**
     Defines how to retrieve a StyleSet using a styleKey. i.e. retrieve from plist, json, user defaults, programmatic definition. Source of style sets could be included at compile time or downloaded at run time, or updated dynamically throughout lifecycle of app.
    */
    static func retrieveStyleSet(forStyleKey styleKey: StyleKeyProtocol) -> StyleSet?
    
}

extension StyleStrategy {
    
    /**
     Useful function for transforming a dictionary into a StyleSet. Use this function for values that must be transformed from an abstract representation into its meaningful value. i.e. transforming a color key as a String into a UIColor
     
     - Parameter properties: [String: Any] containing all property keys -> values
     - Parameter ColorSetType: Optional. If set contains any colors that need to be transformed from String -> UIColor, use a type implementing ColorSetProtocol to perform the conversion
     - Parameter FontSetType: Optional. If set contains any fonts that need to be transformed from String -> UIFont, use a type implementing FontSetProtocol to perform the conversion
     - Parameter customTransformation: Optional. Performs custom logic for transforming dictionary's value into a value consumable by the StyleSet
     - Returns: A style set converted from dictionary
    */
    public static func transformDictionaryOfPropertiesIntoStyleSet(properties: [String: Any], ColorSetType: ColorSetProtocol.Type? = nil, FontSetType: FontSetProtocol.Type? = nil, customTransformation: ((Any) -> Any?)? = nil) -> StyleSet {
        
        //Map over values to apply transformations
        let transformedProps = properties.mapValues { value -> Any in
            
            //Attempt to transform string values into colors and fonts using ColorSetProtocol and FontSetProtocol
            if let str = value as? String {
                if let c = ColorSetType?.init(rawValue: str) {
                    return c.color
                }
                if let f = FontSetType?.init(rawValue: str) {
                    return f.font
                }
            }
            
            //if given transformation, apply to given value. If operation returns an object, return that object. if nil, continue on.
            if let transform = customTransformation, let customValue = transform(value) {
                return customValue
            }
            
            return value
        }
        
        let styleSet = StyleSet(properties: transformedProps)
        return styleSet
    }
}
