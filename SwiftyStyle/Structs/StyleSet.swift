//
//  StyleSet.swift
//  SwiftyStyle
//
//  Created by Luke Street on 10/29/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

/**
 Conform to this protocol in order to interact with StyleSet
 */
public protocol StylePropertyProtocol {
    var rawValue: String { get }
}

/**
 Conform to StylePropertyProtocol for easy use with StyleSet
 */
extension String: StylePropertyProtocol {
    public var rawValue: String {
        return self
    }
}

/**
 Conforms to StylePropertyProtocol and contains all common style properties.
*/
public enum StyleProperty: String, StylePropertyProtocol {
    
    //General
    
    /**
        Text color
    */
    case textColor
    /**
     Font size
    */
    case fontSize
    /**
     Font
    */
    case font
    
    /**
     Cackground color
    */
    case backgroundColor
    /**
     Tint color
    */
    case tintColor
    
    /**
     Border color
    */
    case borderColor
    /**
     Border width
    */
    case borderWidth
    
    //Used for UIButtons
    
    /**
     Title color for normal state
    */
    case normalTitleColor
    /**
     Background color for normal state
    */
    case normalBackgroundColor
    /**
     Title shadow color for normal state
    */
    case normalTitleShadowColor
    
    /**
     Title color for disabled state
    */
    case disabledTitleColor
    /**
     Background color for disabled state
    */
    case disabledBackgroundColor
    /**
     Title shadow color for disabled state
    */
    case disabledTitleShadowColor
    
    
    /**
     Title color for selected state
    */
    case selectedTitleColor
    /**
     Background color for selected state
    */
    case selectedBackgroundColor
    /**
     Title shadow color for selected state
    */
    case selectedTitleShadowColor
    
    /**
     Title color for highlighted state
    */
    case highlightedTitleColor
    /**
     Background color for highlighted state
    */
    case highlightedBackgroundColor
    /**
     Title shadow color for highlighted state
    */
    case highlightedTitleShadowColor
}

/**
 Hold properties used to style a control.
 */
public struct StyleSet {
    
    /**
     Empty initializer
    */
    public init() {}
    
    /**
     Initialize with dictionary of StylePropertyProtocols: Any
     */
    public init<Property: StylePropertyProtocol>(properties: [Property: Any]) {
        for keyValue in properties {
            self.properties[keyValue.key.rawValue] = keyValue.value
        }
    }
    
    /**
     Holds internal properties
    */
    private var properties = [String: Any]()
    
    /**
     Retrieves value of type T using property of type conforming to StylePropertyProtocol
     */
    private func getValue<T, StyleProperty: StylePropertyProtocol>(for property: StyleProperty) -> T? {
        
        guard let prop = properties[property.rawValue] else {
            return nil
        }
        
        guard let typedProp = prop as? T else {
            print("Property \(property) has a value of type \(type(of: prop)), not \(String(describing: T.self))")
            return nil
        }
        
        return typedProp
    }
    
    /**
     Sets value of type T for property of type conforming to StylePropertyProtocol
     */
    private mutating func setValue<T, Property: StylePropertyProtocol>(for type: Property, value: T) {
        properties[type.rawValue] = value
    }
    
    /**
     Sets and retrieves properties inside the StyleSet
    */
    public subscript <T, Property: StylePropertyProtocol>(property: Property) -> T? {
        get {
            return getValue(for: property)
        }
        set {
            setValue(for: property, value: newValue)
        }
    }
}

extension StyleSet {
    
    /**
     Convenience subscript using default implementation of StyleProperty for better type inference
    */
    public subscript <T>(property: StyleProperty) -> T? {
        get {
            return getValue(for: property)
        }
        set {
            setValue(for: property, value: newValue)
        }
    }
}
