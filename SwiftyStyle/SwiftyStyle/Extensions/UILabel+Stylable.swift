//
//  UILabel+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/8/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension UILabel {
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

extension SwiftyStyleProtocol where Self: UILabel {
    
    /**
     Default implementation of SwiftyStyleProtocol for UILabel
     */
    public func style(styleSet: StyleSet) {
        if let color: UIColor = styleSet[StyleProperty.textColor] {
            self.textColor = color
        }
        if let font: UIFont = styleSet[.font] {
            self.font = font
        }
        if let fontSize: CGFloat = styleSet[.fontSize] {
            self.font = font.withSize(fontSize)
        }
        if let borderWidth: CGFloat = styleSet[.borderWidth] {
            self.layer.borderWidth = borderWidth
        }
        if let borderColor: UIColor = styleSet[.borderColor] {
            self.layer.borderColor = borderColor.cgColor
        }
        if let backgroundColor: UIColor = styleSet[.backgroundColor] {
            self.backgroundColor = backgroundColor
        }
        if let tintColor: UIColor = styleSet[.tintColor] {
            self.tintColor = tintColor
        }
    }
}
