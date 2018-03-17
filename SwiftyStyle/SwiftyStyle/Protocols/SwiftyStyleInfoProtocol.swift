//
//  SwiftyStyleInfoProtocol.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/12/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

/**
 Conform to this protocol in a base class in order to add stored info needed for styling
 If your control needs to be re-styled throughout the app's lifecycle, use this protocol
 */
public protocol SwiftyStyleInfoProtocol: class {
    
    /**
     Stores all information needed to style control after initial styling. Namely, this class holds a styleKey and the listener for re-styling triggered by the StyleManager
    */
    var styleInfo: StyleInfo { get set }
    
}

extension SwiftyStyleInfoProtocol {
    
    /**
     Computed property to expose styleKey outside of module, On get/set attach control to StyleInfo to start listening for re-style events
    */
    public var styleKey: StyleKeyProtocol? {
        get {
            if let stylable = self as? SwiftyStyleProtocol & SwiftyStyleInfoProtocol {
                styleInfo.attach(stylable: stylable)
            }
            return styleInfo.styleKey
        }
        set {
            if let stylable = self as? SwiftyStyleProtocol & SwiftyStyleInfoProtocol {
                styleInfo.attach(stylable: stylable)
            }
            if let key = newValue {
                (self as? SwiftyStyleProtocol)?.style(as: key)
            }
            styleInfo.styleKey = newValue
        }
    }
}
