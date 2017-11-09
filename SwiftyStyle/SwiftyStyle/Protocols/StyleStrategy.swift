//
//  StyleStrategy.swift
//  SwiftyStyle
//
//  Created by Luke Street on 10/29/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

public protocol StyleStrategy {
    
    static func retrieveStyleSet(forStyleKey styleKey: String) -> StyleSet?
    
}

extension StyleStrategy {
    public static func transformDictionaryOfPropertiesIntoStyleSet<ColorSet: ColorSetProtocol, FontSet: FontSetProtocol>(properties: [String: Any], ColorSetType: ColorSet.Type, FontSetType: FontSet.Type) -> StyleSet {
        let transformedProps =  properties.mapValues({ value -> Any in
            if let str = value as? String {
                if let c = ColorSet(rawValue: str) {
                    return c.color
                }
                if let f = FontSet(rawValue: str) {
                    return f.font
                }
            }
            return value
        })
        
        let styleSet = StyleSet(properties: transformedProps)
        return styleSet
    }
}
