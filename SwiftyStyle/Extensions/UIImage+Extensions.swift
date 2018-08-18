//
//  UIImage+Extensions.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/10/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     Allows adding mask to image
     
     - Parameter with tintColor: UIColor used for masking image
     - Returns: UIImage tinted as tintColor
    */
    internal func maskedImage(with tintColor: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        guard let cgImage = self.cgImage, let currentContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        
        var image: UIImage = self
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        let translateHeight = floor(rect.size.height)
        
        currentContext.scaleBy(x: 1.0, y: -1.0)
        currentContext.translateBy(x: 0.0, y: -translateHeight)
        currentContext.clip(to: rect, mask: cgImage)
        currentContext.setFillColor(tintColor.cgColor)
        currentContext.fill(rect)
        currentContext.translateBy(x: 0.0, y: translateHeight)
        currentContext.scaleBy(x: 1.0, y: -1.0)
        
        if let contextImage = UIGraphicsGetImageFromCurrentImageContext() {
            image = contextImage.resizableImage(withCapInsets: self.capInsets, resizingMode: self.resizingMode)
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
}
