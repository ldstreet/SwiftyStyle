//
//  UIImageView+Stylable.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/10/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

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
