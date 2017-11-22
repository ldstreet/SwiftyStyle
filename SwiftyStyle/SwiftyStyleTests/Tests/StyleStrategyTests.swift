//
//  StyleStrategyTests.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 11/21/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import XCTest
import UIKit
@testable import SwiftyStyle

class StyleStrategyTests: XCTestCase {
    
    func testTransformDictionaryOfPropertiesIntoStyleSet() {
        
        // No transformations
        let basicSet = StyleStrategyMock.transformDictionaryOfPropertiesIntoStyleSet(properties: ["borderWidth": CGFloat(12.0)])
        let borderWidth: CGFloat? = basicSet[.borderWidth]
        XCTAssertEqual(borderWidth, 12.0)
        
        // Color Transformation
        let basicSetWithColor = StyleStrategyMock.transformDictionaryOfPropertiesIntoStyleSet(properties: ["borderColor": "00ff00"], ColorSetType: HexColorSet.self)
        let borderColor: UIColor? = basicSetWithColor[.borderColor]
        XCTAssertEqual(borderColor, .green)
        
        // Font transformation
        let basicSetWithFont = StyleStrategyMock.transformDictionaryOfPropertiesIntoStyleSet(properties: ["font": "body"], FontSetType: PreferredFontSet.self)
        let font: UIFont? = basicSetWithFont[.font]
        XCTAssertEqual(font, UIFont.preferredFont(forTextStyle: .body))
        
        // Custom transformation
        let basicSetWithCustom = StyleStrategyMock.transformDictionaryOfPropertiesIntoStyleSet(properties: ["Double": 10.0, "NonDouble": CGFloat(10.0)]) { value in
            if let doub = value as? Double {
                return "\(doub)"
            }
            return nil
        }
        let custom: String? = basicSetWithCustom["Double"]
        let nonDouble: CGFloat? = basicSetWithCustom["NonDouble"]
        XCTAssertEqual(custom, "10.0")
        XCTAssertEqual(nonDouble, CGFloat(10.0))
        
        // All together now
        let dict: [String : Any] = ["borderWidth": CGFloat(12.0),
                                    "borderColor": "00ff00",
                                    "font": "body",
                                    "fontSize": CGFloat(10.0),
                                    "textColor": ff0000,
                                    "tintColor": "ff0000",
                                    "backgroundColor": "ff0000",
                                    "fontSize": CGFloat(10.0),
                                    "fontSize": CGFloat(10.0),
                                    "Double": 10.0,
                                    "NonDouble": CGFloat(10.0)]
        let complexSet = StyleStrategyMock.transformDictionaryOfPropertiesIntoStyleSet(properties: dict, ColorSetType: HexColorSet.self, FontSetType: PreferredFontSet.self) { value in
            if let doub = value as? Double {
                return "\(doub)"
            }
            return nil
        }
        complexSet.
        XCTAssertEqual(complexSet[.borderWidth], CGFloat(12.0))
        XCTAssertEqual(complexSet[.borderColor], UIColor.green)
        XCTAssertEqual(complexSet[.font], UIFont.preferredFont(forTextStyle: .body))
        XCTAssertEqual(complexSet["Double"], "10.0")
        XCTAssertEqual(complexSet["NonDouble"], CGFloat(10.0))
        
    }
    
}
