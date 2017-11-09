//
//  FontSet.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/7/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import Foundation

public protocol FontSetProtocol {
    init?(rawValue: String)
    var rawValue: String { get }
    var font: UIFont { get }
}

public struct CustomFontSet: FontSetProtocol {
    
    public init?(rawValue: String) {
        guard let font = UIFont(name: rawValue, size: 25.0) else { return nil }
        self.font = font
        self.rawValue = rawValue
    }
    
    public var rawValue: String
    
    public var font: UIFont
    
}


public enum SystemFontSet: String, FontSetProtocol {

    case regular, bold, semibold, medium, black, light, ultraLight, thin, heavy, italic
    
    public var font: UIFont {
        switch self {
            
        case .regular:
            return UIFont.systemFont(ofSize: 25, weight: .regular)
        case .bold:
            return UIFont.systemFont(ofSize: 25, weight: .bold)
        case .semibold:
            return UIFont.systemFont(ofSize: 25, weight: .semibold)
        case .medium:
            return UIFont.systemFont(ofSize: 25, weight: .medium)
        case .black:
            return UIFont.systemFont(ofSize: 25, weight: .black)
        case .light:
            return UIFont.systemFont(ofSize: 25, weight: .light)
        case .ultraLight:
            return UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        case .thin:
            return UIFont.systemFont(ofSize: 25, weight: .thin)
        case .heavy:
            return UIFont.systemFont(ofSize: 25, weight: .heavy)
        case .italic:
            return UIFont.italicSystemFont(ofSize: 25)
        }
    }
}

//When using this FontSet, no sizes need be specified as they are implicitly derived from UIFontTextStyle
public enum PreferredFontSet: String, FontSetProtocol {
    
    case body, callout, caption1, caption2, footnote, headline, subheadline, largeTitle, title1, title2, title3
    
    public var font: UIFont {
        switch self {
        case .body:
            return UIFont.preferredFont(forTextStyle: .body)
        case .callout:
            return UIFont.preferredFont(forTextStyle: .callout)
        case .caption1:
            return UIFont.preferredFont(forTextStyle: .caption1)
        case .caption2:
            return UIFont.preferredFont(forTextStyle: .caption2)
        case .footnote:
            return UIFont.preferredFont(forTextStyle: .footnote)
        case .headline:
            return UIFont.preferredFont(forTextStyle: .headline)
        case .subheadline:
            return UIFont.preferredFont(forTextStyle: .subheadline)
        case .largeTitle:
            return UIFont.preferredFont(forTextStyle: .largeTitle)
        case .title1:
            return UIFont.preferredFont(forTextStyle: .title1)
        case .title2:
            return UIFont.preferredFont(forTextStyle: .title2)
        case .title3:
            return UIFont.preferredFont(forTextStyle: .title3)
        }
    }
}
