//
//  PlistStyleStrategy.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/5/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

internal protocol PlistStyleStrategyProtocol: StyleStrategy {

    associatedtype CS: ColorSetProtocol
    associatedtype FS: FontSetProtocol
    static var plistStyleStrategyInfo: PlistStyleStrategyInfo { get set }
}

extension PlistStyleStrategyProtocol {
    
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
        return transformDictionaryOfPropertiesIntoStyleSet(properties: props, ColorSetType: CS.self, FontSetType: FS.self)
    }
    
}

final public class PlistStyleStrategy<ColorSet: ColorSetProtocol, FontSet: FontSetProtocol>: PlistStyleStrategyBase, PlistStyleStrategyProtocol {

    public typealias CS = ColorSet
    public typealias FS = FontSet
    
}

public class PlistStyleStrategyBase {
    
    private init() {}
    
    internal static var plistStyleStrategyInfo = PlistStyleStrategyInfo()
    
    public static func setPlist(forType type: StylePlistType, plistName name: String, bundle: Bundle = Bundle.main) {
        plistStyleStrategyInfo.setPlist(forType: type, plistName: name, bundle: bundle)
    }
}

public enum StylePlistType {
    case defaultPlist, regularRegularPlist, regularCompactPlist, compactCompactPlist, compactRegularPlist
}

internal class PlistStyleStrategyInfo {
    
    internal init() {}
    
    internal func setPlist(forType type: StylePlistType, plistName name: String, bundle: Bundle = Bundle.main) {
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
    
    fileprivate var defaultPlist: [String: [String: Any]]?
    fileprivate var regularRegularPlist: [String: [String: Any]]?
    fileprivate var regularCompactPlist: [String: [String: Any]]?
    fileprivate var compactCompactPlist: [String: [String: Any]]?
    fileprivate var compactRegularPlist: [String: [String: Any]]?
    
    private func retrievePlist(with name: String, bundle: Bundle) -> [String: [String: Any]]? {
        guard let path = bundle.path(forResource: name, ofType: "plist") else {
            print("Could not find plist \(name) in the specified bundle.")
            return nil
        }
        let dict = NSDictionary(contentsOfFile: path) as? [String: [String: Any]]
        return dict
        
    }
}


