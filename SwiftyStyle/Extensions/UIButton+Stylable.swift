//
//  UIButton+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/3/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension UIButton {
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

extension SwiftyStyleProtocol where Self: UIButton {
    
    /**
     Basic implemetation to set background color of UIButton
    */
    private func setBackgroundColor(color: UIColor, state: UIControlState) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        
        guard let currentContext = UIGraphicsGetCurrentContext() else { return }
        
        currentContext.setFillColor(color.cgColor)
        
        currentContext.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: state)
    }
    
    /**
     Default implementation of SwiftyStyleProtocol for UIButton
     */
    public func style(styleSet: StyleSet) {
        
        //Normal State
        if let titleColor: UIColor = styleSet[.normalTitleColor] {
            self.setTitleColor(titleColor, for: .normal)
        }
        if let titleShadowColor: UIColor = styleSet[.normalTitleShadowColor] {
            self.setTitleShadowColor(titleShadowColor, for: .normal)
        }
        if let backgroundColor: UIColor = styleSet[.normalBackgroundColor] {
            self.setBackgroundColor(color: backgroundColor, state: .normal)
        }
        
        //Disabled State
        if let titleColor: UIColor = styleSet[.disabledTitleColor] {
            self.setTitleColor(titleColor, for: .disabled)
        }
        if let titleShadowColor: UIColor = styleSet[.disabledTitleShadowColor] {
            self.setTitleShadowColor(titleShadowColor, for: .disabled)
        }
        if let backgroundColor: UIColor = styleSet[.disabledBackgroundColor] {
            self.setBackgroundColor(color: backgroundColor, state: .disabled)
        }
        
        //Selected State
        if let titleColor: UIColor = styleSet[.selectedTitleColor] {
            self.setTitleColor(titleColor, for: .selected)
        }
        if let titleShadowColor: UIColor = styleSet[.selectedTitleShadowColor] {
            self.setTitleShadowColor(titleShadowColor, for: .selected)
        }
        if let backgroundColor: UIColor = styleSet[.selectedBackgroundColor] {
            self.setBackgroundColor(color: backgroundColor, state: .selected)
        }
        
        //Highlighted State
        if let titleColor: UIColor = styleSet[.highlightedTitleColor] {
            self.setTitleColor(titleColor, for: .highlighted)
        }
        if let titleShadowColor: UIColor = styleSet[.highlightedTitleShadowColor] {
            self.setTitleShadowColor(titleShadowColor, for: .highlighted)
        }
        if let backgroundColor: UIColor = styleSet[.highlightedBackgroundColor] {
            self.setBackgroundColor(color: backgroundColor, state: .highlighted)
        }
        
        //All States
        if let font: UIFont = styleSet[.font] {
            self.titleLabel?.font = font
        }
        if let fontSize: CGFloat = styleSet[.fontSize] {
            self.titleLabel?.font = self.titleLabel?.font.withSize(fontSize)
        }
        if let borderWidth: CGFloat = styleSet[.borderWidth] {
            self.layer.borderWidth = borderWidth
        }
        if let borderColor: UIColor = styleSet[.borderColor] {
            self.layer.borderColor = borderColor.cgColor
        }
        if let tintColor: UIColor = styleSet[.tintColor] {
            self.tintColor = tintColor
        }
    }
}
