//
//  StyleStrategyMock.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 11/21/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

public class StyleStrategyMock: StyleStrategy {
    
    internal static var retrievedDictionary: [String: Any]?
    internal static var retrieveStyleSetCount = 0
    
    
    public static func retrieveStyleSet(forStyleKey styleKey: String) -> StyleSet? {
        retrieveStyleSetCount += 1
        
        guard styleKey != "No style key" else { return nil }
        
        guard let dict = retrievedDictionary else { return nil }
        
        return transformDictionaryOfPropertiesIntoStyleSet(properties: dict,
                                                           ColorSetType: HexColorSet.self,
                                                           FontSetType: PreferredFontSet.self)
    }
}
