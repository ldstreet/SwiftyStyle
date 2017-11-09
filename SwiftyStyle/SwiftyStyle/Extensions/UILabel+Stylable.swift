//
//  UILabel+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/8/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension SwiftyStyleProtocol where Self: UILabel {
    
    public func style(styleSet: StyleSet) {
        if let color: UIColor = styleSet[.normalTextColor] {
            self.textColor = color
        }
    }
}
