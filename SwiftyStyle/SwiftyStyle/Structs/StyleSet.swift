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
    
    case normalTextColor
    
    case fontSize
    case font
    
    
    case backgroundColor
    case borderColor
    case borderWidth
    case tintColor
    
    
}

public struct StyleSet {
    
    public init() {}
    
    public init(properties: [String: Any]) {
        self.properties = properties
    }
    
    private var properties = [String: Any]()
    
    public func getValue<T>(for property: StylePropertyProtocol) -> T? {
        
        return getValue(for: property.rawValue)
    }
    
    public mutating func setValue<T>(for type: StylePropertyProtocol, value: T) {
        setValue(for: type.rawValue, value: value)
    }

    public func getValue<T>(for property: String) -> T? {
        guard let prop = properties[property] else {
            return nil
        }
        
        guard let typedProp = prop as? T else {
            print("Property \(property) has a value of type \(type(of: prop)), not \(String(describing: T.self))")
            return nil
        }
        
        return typedProp
    }
    
    public mutating func setValue<T>(for type: String, value: T) {
        properties[type] = value
    }
    
    public subscript <T>(property: String) -> T? {
        get {
            return getValue(for: property)
        }
        set {
            setValue(for: property, value: newValue)
        }
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
