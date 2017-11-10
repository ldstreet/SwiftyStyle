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

public struct HexColorSet: ColorSetProtocol {
    
    public init?(rawValue: String) {
        let r, g, b: CGFloat
        let start = rawValue.startIndex
        let hexColor = String(rawValue[start...])
        
        guard hexColor.count == 6 else { return nil }
        
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }
        
        r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        b = CGFloat((hexNumber & 0x0000ff) >> 0) / 255
        
        self.color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        self.rawValue = rawValue
    }
    
    public var rawValue: String
    
    public var color: UIColor
    
}

public enum SwiftyStyleColorSet: String, ColorSetProtocol {
    
    case red
    case green
    case blue
    
    public var color: UIColor {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
    
    
}
