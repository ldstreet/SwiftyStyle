//
//  FontSet.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/7/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

public protocol FontSetProtocol {
    init?(rawValue: String)
    var rawValue: String { get }
    var font: UIFont { get }
}

/**
 Implementation of FontSetProtocol which uses UIFont's init(name:, size:) function to transform Strings into UIFonts using the font's name as the String key.
 
 - Remark: Uses default pointSize of 25. To set pointSize, consider defining property like fontSize to call UIFont's .withSize(fontSize:) to convert this to a new Font with a given size.
 
 */
public struct CustomFontSet: FontSetProtocol {
    
    public init?(rawValue: String) {
        guard let font = UIFont(name: rawValue, size: 25.0) else { return nil }
        self.font = font
        self.rawValue = rawValue
    }
    
    public var rawValue: String
    
    public var font: UIFont
    
}

/**
 Implementation of FontSetProtocol which uses UIFont's systemFont(ofSize:, weight:) function to transform Strings into UIFonts using the font weight as the String key.
 
 - Remark: Uses default pointSize of 25. To set pointSize, consider defining property like fontSize to call UIFont's .withSize(fontSize:) to convert this to a new Font with a given size.
 
 */
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

/**
 Implementation of FontSetProtocol which uses UIFont's preferredFont(forTextStyle:) function to transform Strings into UIFonts
 
 - Remark: When using this FontSet, no sizes need be specified as they are implicitly derived from UIFontTextStyle
 */
public enum PreferredFontSet: String, FontSetProtocol {
    
    case body, callout, caption1, caption2, footnote, headline, subheadline, title1, title2, title3
    
    //@available(iOS 11.0, *)
    case largeTitle
    
    
    public var font: UIFont {
        switch self {
        case .body:
            return UIFont.preferredFont(forTextStyle: .body, compatibleWith: UIApplication.shared.traitCollection)
        case .callout:
            return UIFont.preferredFont(forTextStyle: .callout, compatibleWith: UIApplication.shared.traitCollection)
        case .caption1:
            return UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: UIApplication.shared.traitCollection)
        case .caption2:
            return UIFont.preferredFont(forTextStyle: .caption2, compatibleWith: UIApplication.shared.traitCollection)
        case .footnote:
            return UIFont.preferredFont(forTextStyle: .footnote, compatibleWith: UIApplication.shared.traitCollection)
        case .headline:
            return UIFont.preferredFont(forTextStyle: .headline, compatibleWith: UIApplication.shared.traitCollection)
        case .subheadline:
            return UIFont.preferredFont(forTextStyle: .subheadline, compatibleWith: UIApplication.shared.traitCollection)
        case .largeTitle:
            if #available(iOS 11.0, *) {
                return UIFont.preferredFont(forTextStyle: .largeTitle, compatibleWith: UIApplication.shared.traitCollection)
            } else {
                return UIFont.preferredFont(forTextStyle: .title1, compatibleWith: UIApplication.shared.traitCollection)
            }
        case .title1:
            return UIFont.preferredFont(forTextStyle: .title1, compatibleWith: UIApplication.shared.traitCollection)
        case .title2:
            return UIFont.preferredFont(forTextStyle: .title2, compatibleWith: UIApplication.shared.traitCollection)
        case .title3:
            return UIFont.preferredFont(forTextStyle: .title3, compatibleWith: UIApplication.shared.traitCollection)
        }
    }
}
