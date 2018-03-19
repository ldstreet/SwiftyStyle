//
//  UIImageView+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/10/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension UIImageView {
    /**
     Inspectable styleKey that can be used on any stylable control. If view conforms to `SwiftyStyleInfoProtocol`, this key will be stored into styleInfo property. If not, key will not be stored and will only be used to call the `SwiftyStyleProtocol` function `style(as:)` on intial set of this variable.
     */
    @IBInspectable var styleKey: String? {
        get {
            return (self as? SwiftyStyleInfoProtocol)?.styleKey?.rawValue
        }
        set {
            guard let info = self as? SwiftyStyleInfoProtocol else {
                if let key = newValue {
                    (self as? SwiftyStyleProtocol)?.style(as: key)
                }
                return
            }
            info.styleKey = newValue
        }
    }
}

extension SwiftyStyleProtocol where Self: UIImageView {
    
    /**
     Default implementation of SwiftyStyleProtocol for UIImageView
    */
    public func style(styleSet: StyleSet) {
        if let tintColor: UIColor = styleSet[.tintColor] {
            self.image = self.image?.withRenderingMode(.alwaysTemplate)
            self.tintColor = tintColor
        }
    }
}
