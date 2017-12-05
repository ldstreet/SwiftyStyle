//
//  UIApplication+Extensions.swift
//  SwiftyStyle
//
//  Created by Luke Street on 12/5/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension UIApplication {
    
    /**
     Convenience variable for retrieving traitCollection of they key window's root view controller
     */
    internal var traitCollection: UITraitCollection? {
        return self.windows.first?.rootViewController?.traitCollection
    }
    
    /**
     Convenience variable for retrieving verticalSizeClass of they key window's root view controller
    */
    internal var verticalSizeClass: UIUserInterfaceSizeClass? {
        return self.traitCollection?.verticalSizeClass
    }
    
    /**
     Convenience variable for retrieving horizontalSizeClass of they key window's root view controller
     */
    internal var horizontalSizeClass: UIUserInterfaceSizeClass? {
        return self.traitCollection?.horizontalSizeClass
    }
}
