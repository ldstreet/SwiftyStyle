//
//  BaseStyleImplementationTests.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 11/22/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import XCTest

class BaseStyleImplementationTests: XCTestCase {
    
    var styleSet = StyleSet()
    
    override func setUp() {
        super.setUp()
        
        let styleSetDict: [String: Any] = ["borderWidth": CGFloat(12.0),
                                           "borderColor": "ff0000",
                                           "font": "body",
                                           "fontSize": CGFloat(10.0),
                                           "textColor": "ff0000",
                                           "tintColor": "ff0000",
                                           "backgroundColor": "ff0000",
                                           "normalTitleColor": "ff0000",
                                           "normalBackgroundColor": "ff0000",
                                           "normalTitleShadowColor": "ff0000",
                                           "disabledTitleColor": "00ff00",
                                           "disabledBackgroundColor": "00ff00",
                                           "disabledTitleShadowColor": "00ff00",
                                           "selectedTitleColor": "0000ff",
                                           "selectedBackgroundColor": "0000ff",
                                           "selectedTitleShadowColor": "0000ff",
                                           "highlightedTitleColor": "090008",
                                           "highlightedBackgroundColor": "999999",
                                           "highlightedTitleShadowColor": "999999"]
        styleSet = StyleStrategyMock.transformDictionaryOfPropertiesIntoStyleSet(properties: styleSetDict, ColorSetType: HexColorSet.self, FontSetType: PreferredFontSet.self)
    }
    
    func testLabel() {
        
    }
    
    func testButton() {
        let button = UIButton()
        button.style(styleSet: styleSet)
        XCTAssertEqual(button.layer.borderWidth, CGFloat(12.0))
        XCTAssertEqual(button.layer.borderColor, UIColor.red.cgColor)
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: .body).withSize(10.0))
        XCTAssertEqual(button.titleColor(for: .normal), .red)
        XCTAssertEqual(button.titleColor(for: .disabled), .green)
        XCTAssertEqual(button.titleColor(for: .selected), .blue)
        XCTAssertEqual(button.titleColor(for: .highlighted), .purple)
        XCTAssertEqual(button.layer.borderWidth, CGFloat(12.0))
        XCTAssertEqual(button.layer.borderWidth, CGFloat(12.0))
        XCTAssertEqual(button.layer.borderWidth, CGFloat(12.0))
        XCTAssertEqual(button.layer.borderWidth, CGFloat(12.0))
        XCTAssertEqual(button.layer.borderWidth, CGFloat(12.0))
    }
    
}

extension UIButton: StylableBasic {
    public typealias Strategy = StyleStrategyMock
}
