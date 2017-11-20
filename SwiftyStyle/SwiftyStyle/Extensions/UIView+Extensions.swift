//
//  UIView+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/10/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Inspecatble styleKey that can be used on any stylable control. If view conforms to SwiftyStyleInfoProtocol, stlye using key. If view conforms to  SwiftyStyleBasicKeyProtocol, style only on set
    */
    @IBInspectable public var styleKey: String? {
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
