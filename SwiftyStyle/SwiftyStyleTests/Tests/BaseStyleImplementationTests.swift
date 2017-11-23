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
                                       "borderColor": "00ff00",
                                       "font": "body",
                                       "fontSize": CGFloat(10.0),
                                       "textColor": "ff0000",
                                       "tintColor": "ff0000",
                                       "backgroundColor": "ff0000",
                                       "Double": 10.0,
                                       "NonDouble": CGFloat(10.0)]
        styleSet = StyleStrategyMock.transformDictionaryOfPropertiesIntoStyleSet(properties: styleSetDict, ColorSetType: HexColorSet.self, FontSetType: PreferredFontSet.self)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testButton() {
        let button = UIButton()
        button.style(styleSet: styleSet)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension UIButton: StylableBasic {
    public typealias Strategy = StyleStrategyMock
}
