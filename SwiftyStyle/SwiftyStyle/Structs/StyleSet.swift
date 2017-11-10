//
//  StyleSet.swift
//  SwiftyStyle
//
//  Created by Luke Street on 10/29/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

public protocol StylePropertyProtocol {
    var rawValue: String { get }
}

//An enum with all
public enum StyleProperty: String, StylePropertyProtocol {
    //General
    case textColor
    case fontSize
    case font
    
    case backgroundColor
    case tintColor
    
    case borderColor
    case borderWidth
    
    //Used for UIButtons
    case normalTitleColor
    case normalBackgroundColor
    case normalTitleShadowColor
    
    case disabledTitleColor
    case disabledBackgroundColor
    case disabledTitleShadowColor
    
    case selectedTitleColor
    case selectedBackgroundColor
    case selectedTitleShadowColor
    
    case highlightedTitleColor
    case highlightedBackgroundColor
    case highlightedTitleShadowColor
}

public struct StyleSet {
    
    public init() {}
    
    public init(properties: [String: Any]) {
        self.properties = properties
    }
    
    private var properties = [String: Any]()
    
    public func getValue<T>(for property: StylePropertyProtocol) -> T? {
        
        guard let prop = properties[property.rawValue] else {
            return nil
        }
        
        guard let typedProp = prop as? T else {
            print("Property \(property) has a value of type \(type(of: prop)), not \(String(describing: T.self))")
            return nil
        }
        
        return typedProp
    }
    
    public mutating func setValue<T>(for type: StylePropertyProtocol, value: T) {
        properties[type.rawValue] = value
    }
    
    public subscript <T>(property: StylePropertyProtocol) -> T? {
        get {
            return getValue(for: property)
        }
        set {
            setValue(for: property, value: newValue)
        }
    }
}

extension String: StylePropertyProtocol {
    public var rawValue: String {
        return self
    }
}

extension StyleSet {
    
    public init(properties: [StyleProperty: Any]) {
        for keyValue in properties {
            self.properties[keyValue.key.rawValue] = keyValue.value
        }
    }
    
    public subscript <T>(property: StyleProperty) -> T? {
        get {
            return getValue(for: property)
        }
        set {
            setValue(for: property, value: newValue)
        }
    }
}
