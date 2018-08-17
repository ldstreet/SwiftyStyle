//
//  PlistStyleStrategyInfo.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/20/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

/**
 Defines all possible plists used in PlistStyleStrategy
*/
public enum StylePlistType {
    case defaultPlist
    case regularRegularPlist
    case regularCompactPlist
    case compactCompactPlist
    case compactRegularPlist
}

/**
 Struct which holds all plists loaded into dictionaries
*/
internal struct PlistStyleStrategyInfo {
    
    /**
     Empty, internal init
    */
    internal init() {}
    
    /**
     Retrieves and stores plist into memory
     
     - Parameter forType type: Specific plist type to be set
     - Parameter plistName name: Name of plist to be found
     - Parameter bundle: Bundle that contains plist. Defaults to Bundle.main
     
     - Remark: For now, bundles are loaded into memory on set, they are not reloaded dynamically. To update PlistStyleStrategyInfo, call this function when/if plist is changed
    */
    internal mutating func setPlist(forType type: StylePlistType, plistName name: String, bundle: Bundle = Bundle.main) {
        switch type {
        case .defaultPlist:
            defaultPlist = retrievePlist(with: name, bundle: bundle)
        case .regularRegularPlist:
            regularRegularPlist = retrievePlist(with: name, bundle: bundle)
        case .regularCompactPlist:
            regularCompactPlist = retrievePlist(with: name, bundle: bundle)
        case .compactCompactPlist:
            compactCompactPlist = retrievePlist(with: name, bundle: bundle)
        case .compactRegularPlist:
            compactRegularPlist = retrievePlist(with: name, bundle: bundle)
        }
    }
    
    /**
     Main plist used for default definitions of styles
    */
    internal var defaultPlist: [String: [String: Any]]?
    /**
     Plist used for styles when device has horizontal size class of regular and vertical size class of regular
     */
    internal var regularRegularPlist: [String: [String: Any]]?
    /**
     Plist used for styles when device has horizontal size class of regular and vertical size class of compact
     */
    internal var regularCompactPlist: [String: [String: Any]]?
    /**
     Plist used for styles when device has horizontal size class of compact and vertical size class of regular
     */
    internal var compactCompactPlist: [String: [String: Any]]?
    /**
     Plist used for styles when device has horizontal size class of compact and vertical size class of compact
     */
    internal var compactRegularPlist: [String: [String: Any]]?
    
    /**
     Retrieves plist for given name from specified bundle and returns dictionary
    */
    private func retrievePlist(with name: String, bundle: Bundle) -> [String: [String: Any]]? {
        guard let path = bundle.path(forResource: name, ofType: "plist") else {
            print("Could not find plist \(name) in the specified bundle.")
            return nil
        }
        let dict = NSDictionary(contentsOfFile: path) as? [String: [String: Any]]
        return dict
    }
}
