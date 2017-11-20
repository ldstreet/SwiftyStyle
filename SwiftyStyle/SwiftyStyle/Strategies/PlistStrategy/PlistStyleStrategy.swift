//
//  PlistStyleStrategy.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/5/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

/**
 Base class for PlistStyleStrategy which holds static PlistStyleStrategyInfo since classes with generics cannot hold stored static variables
*/
public class PlistStyleStrategyBase {
    
    private init() {}
    
    /**
     Container for all plists loaded to memory
    */
    internal static var plistStyleStrategyInfo = PlistStyleStrategyInfo()
    
    /**
     Retrieves and stores plist into memory
     
     - Parameter forType type: Specific plist type to be set
     - Parameter plistName name: Name of plist to be found
     - Parameter bundle: Bundle that contains plist. Defaults to Bundle.main
     
     - Remark: For now, bundles are loaded into memory on set, they are not reloaded dynamically. To update PlistStyleStrategyInfo, call this function when/if plist is changed
     */
    public static func setPlist(forType type: StylePlistType, plistName name: String, bundle: Bundle = Bundle.main) {
        plistStyleStrategyInfo.setPlist(forType: type, plistName: name, bundle: bundle)
    }
}

final public class PlistStyleStrategy<ColorSet: ColorSetProtocol, FontSet: FontSetProtocol>: PlistStyleStrategyBase , StyleStrategy{
    
    /**
     Retreives StyleSet based on styleKey using current size classes to pick appropriate set
    */
    public static func retrieveStyleSet(forStyleKey styleKey: String) -> StyleSet? {
        
        //Properties to be loaded in from plist
        var properties: [String: Any]?
        
        //Preference using plist that maps to current sizeclass
        if let verticalSizeClass = UIApplication.shared.keyWindow?.rootViewController?.traitCollection.verticalSizeClass,
            let horizontalSizeClass = UIApplication.shared.keyWindow?.rootViewController?.traitCollection.verticalSizeClass {
            
            switch (verticalSizeClass, horizontalSizeClass) {
            case (.regular, .regular):
                if let props = plistStyleStrategyInfo.regularRegularPlist?[styleKey] {
                    properties = props
                }
                break
            case (.regular, .compact):
                if let props = plistStyleStrategyInfo.regularCompactPlist?[styleKey] {
                    properties = props
                }
                break
            case (.compact, .compact):
                if let props = plistStyleStrategyInfo.compactCompactPlist?[styleKey] {
                    properties = props
                }
                break
            case (.compact, .regular):
                if let props = plistStyleStrategyInfo.compactRegularPlist?[styleKey] {
                    properties = props
                }
                break
            default:
                break
            }
        }
        
        //If no matching plist for current size class, use default plist
        if properties == nil {
            guard let props = plistStyleStrategyInfo.defaultPlist?[styleKey] else {
                return nil
            }
            properties = props
        }
        
        //If no plists set, return nil
        guard let props = properties else { return nil }
        
        //Transform properties from plist into style set, then return
        return transformDictionaryOfPropertiesIntoStyleSet(properties: props, ColorSetType: ColorSet.self, FontSetType: FontSet.self)
    }
}
