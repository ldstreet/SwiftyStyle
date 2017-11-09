//
//  Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 10/29/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

public typealias Stylable = SwiftyStyleProtocol & SwiftyStyleInfoProtocol & SwiftyStyleSetContainerProtocol
public typealias StylableBasic = SwiftyStyleProtocol & SwiftyStyleBasicKeyProtocol & SwiftyStyleSetContainerProtocol

public typealias StylableExtension = SwiftyStyleProtocol & SwiftyStyleSetContainerProtocol
public typealias StylableBase = SwiftyStyleInfoProtocol

public typealias StylableAdditional = SwiftyAdditionalStyleProtocol

public protocol SwiftyStyleInfoProtocol: class {
    
    var styleInfo: StyleInfo { get set }
    
}

public protocol SwiftyStyleBasicKeyProtocol: class {
    
    var styleKey: String? { get set }
    
}

public protocol SwiftyStyleProtocol: class {
    
    func style(styleSet: StyleSet)
    
    func style(as key: String)
    
    func style()
}

//Conform to this protocol for any additional styling not covered by default style() functions
public protocol SwiftyAdditionalStyleProtocol: class {
    
    func additionalStyle(styleSet: StyleSet)
    
}

public protocol SwiftyStyleSetContainerProtocol: class {
    
    associatedtype Strategy: StyleStrategy
    func styleSet(key: String) -> StyleSet?
    
}

public class StyleInfo {
    
    private weak var stylable: SwiftyStyleProtocol?
    internal var styleKey: String?
    
    internal func attach(stylable: SwiftyStyleProtocol) {
        if self.stylable == nil {
            self.stylable = stylable
        }
        
    }
    
    public init() {
        StyleManager.swiftyStyleNotificationManager.addObserver(forName: .swiftyStyleUpdate, object: nil, queue: nil) { [weak self] _ in
            self?.stylable?.style()
        }
    }
    
    deinit {
        StyleManager.swiftyStyleNotificationManager.removeObserver(self)
    }
    
}

extension SwiftyStyleSetContainerProtocol {
    
    public func styleSet(key: String) -> StyleSet? {
        return Strategy.retrieveStyleSet(forStyleKey: key)
    }
    
}

extension SwiftyStyleInfoProtocol {
    public var styleKey: String? {
        get {
            if let stylable = self as? SwiftyStyleProtocol {
                styleInfo.attach(stylable: stylable)
            }
            return styleInfo.styleKey
        }
        set {
            if let stylable = self as? SwiftyStyleProtocol {
                styleInfo.attach(stylable: stylable)
            }
            styleInfo.styleKey = newValue
        }
    }
}

extension SwiftyStyleProtocol where Self: SwiftyStyleSetContainerProtocol {
    
    public func style() {
        if let styleInfo = self as? SwiftyStyleInfoProtocol, let key = styleInfo.styleKey {
            style(as: key)
        } else {
            print("\(String(describing: Self.self)) does not conform to SwiftyStyleInfoProtocol, cannot call style() without stored key.")
        }
    }
    
    public func style(as key: String) {
        if let set = styleSet(key: key) {
            self.style(styleSet: set)
            
            //Any additional styling needed that is not included in base layer.
            (self as? SwiftyAdditionalStyleProtocol)?.additionalStyle(styleSet: set)
            
        } else {
            print("Could not retrieve styleSet for \(String(describing: Self.self)), make sure styleKey has been set.")
        }
    }
    
}

extension UIView {
    
    @IBInspectable
    public var styleKey: String? {
        get {
            if let info = self as? SwiftyStyleInfoProtocol {
                return info.styleKey
            } else if self is SwiftyStyleBasicKeyProtocol {
                print("Key is not stored when using SwiftyStyleBasicKeyProtocol, value will always be nil. To reuse key, subclass and conform to SwiftyStyleInfoProtocol.")
                return nil
            } else {
                print("You must conform to protocol SwiftyStyleInfoProtocol in order to get a style key!")
                return nil
            }
        }
        set {
            if let info = self as? SwiftyStyleInfoProtocol {
                info.styleKey = newValue
                if let stylable = self as? SwiftyStyleProtocol {
                    stylable.style()
                }
            } else if self is SwiftyStyleBasicKeyProtocol {
                if let stylable = self as? SwiftyStyleProtocol, let key = newValue {
                    stylable.style(as: key)
                }
            } else {
                print("You must conform to protocol SwiftyStyleInfoProtocol or SwiftyStyleBasicKeyProtocol in order to set a style key!")
            }
        }
    }
    
}




