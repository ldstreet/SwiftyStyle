//
//  ColorSet.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/5/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

public protocol ColorSetProtocol {
    init?(rawValue: String)
    var rawValue: String { get }
    var color: UIColor { get }
}

/**
 Implementation of ColorSetProtocol which transform Hex strings into UIColors using the color's hex value as the String key.
 */
public struct HexColorSet: ColorSetProtocol {
    
    /**
     Initializer takes in hex value as String
     
     - Parameter rawValue: Hex value as String, Hex can either contain 8 digits where the last two represent the color's alpha value, or 6 digits in which the alpha defaults to 1.0
     */
    public init?(rawValue: String) {
        
        let r, g, b, a: CGFloat
        let start = rawValue.startIndex
        
        let hexColor = String(rawValue[start...])
        
        guard hexColor.count == 6 || hexColor.count == 8 else { return nil }
        
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else { return nil }
    
        if hexColor.count == 8 {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat((hexNumber & 0x000000ff) >> 0) / 255
        } else {
            r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            b = CGFloat((hexNumber & 0x0000ff) >> 0) / 255
            a = 1.0
        }
        
        self.color = UIColor(red: r, green: g, blue: b, alpha: a)
        self.rawValue = rawValue
    }
    
    /**
     The original string provided during initialization
    */
    public var rawValue: String
    
    /**
     UIColor derived from the rawValue
    */
    public var color: UIColor
    
}
