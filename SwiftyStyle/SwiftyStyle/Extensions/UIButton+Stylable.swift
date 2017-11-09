//
//  UIButton+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/3/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension SwiftyStyleProtocol where Self: UIButton {
    
    public func style(styleSet: StyleSet) {
        if let font: UIFont = styleSet[.font] {
            self.titleLabel?.font = font
        }
        if let fontSize: CGFloat = styleSet[.fontSize] {
            self.titleLabel?.font = UIFont(name: self.titleLabel?.font.fontName ?? "", size: fontSize) ?? self.titleLabel?.font
        }
        if let color: UIColor = styleSet[.normalTextColor] {
            self.setTitleColor(color, for: .normal)
        }
        if let color: UIColor = styleSet[.backgroundColor] {
            self.backgroundColor = color
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
