//
//  UILabel+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/8/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

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
