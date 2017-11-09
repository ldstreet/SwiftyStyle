//
//  PlistStyleStrategy.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/5/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

public protocol PlistStyleStrategyProtocol: StyleStrategy {
    associatedtype ColorSet: ColorSetProtocol
    associatedtype FontSet: FontSetProtocol
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
        return transformDictionaryOfPropertiesIntoStyleSet(properties: props, ColorSetType: ColorSet.self, FontSetType: FontSet.self)
    }
    
}

public class PlistStyleStrategy: PlistStyleStrategyProtocol {
    
    public typealias ColorSet = HexColorSet
    public typealias FontSet = PreferredFontSet
    
    public static var plistStyleStrategyInfo = PlistStyleStrategyInfo()
    
}


public class PlistStyleStrategyInfo {
    
    public init() {}
    
    public func setDefaultPlist(name: String, bundle: Bundle) {
        defaultPlist = retrievePlist(with: name, bundle: bundle)
    }
    
    public func setRegularRegularPlist(name: String, bundle: Bundle) {
        regularRegularPlist = retrievePlist(with: name, bundle: bundle)
    }
    
    public func setRegularCompactPlist(name: String, bundle: Bundle) {
        regularCompactPlist = retrievePlist(with: name, bundle: bundle)
    }
    
    public func setCompactCompactPlist(name: String, bundle: Bundle) {
        compactCompactPlist = retrievePlist(with: name, bundle: bundle)
    }
    
    public func setCompactRegularPlist(name: String, bundle: Bundle) {
        compactRegularPlist = retrievePlist(with: name, bundle: bundle)
    }
    
    public var defaultPlistName: String? {
        didSet {
            if let name = defaultPlistName {
                setDefaultPlist(name: name, bundle: Bundle.main)
            }
        }
    }
    
    public var regularRegularPlistName: String? {
        didSet {
            if let name = regularRegularPlistName {
                setRegularRegularPlist(name: name, bundle: Bundle.main)
            }
        }
    }
    
    public var regularCompactPlistPath: String? {
        didSet {
            if let name = regularCompactPlistPath {
                setRegularCompactPlist(name: name, bundle: Bundle.main)
            }
        }
    }
    
    public var compactCompactPlistPath: String? {
        didSet {
            if let name = compactCompactPlistPath {
                setCompactCompactPlist(name: name, bundle: Bundle.main)
            }
        }
    }
    
    public var compactRegularPlistPath: String? {
        didSet {
            if let name = compactRegularPlistPath {
                setCompactRegularPlist(name: name, bundle: Bundle.main)
            }
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


