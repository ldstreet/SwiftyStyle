//
//  SwiftyStyleProtocolTests.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 11/21/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import XCTest
import UIKit
@testable import SwiftyStyle

class SwiftyStyleProtocolTests: XCTestCase {
    
    override func tearDown() {
        StyleStrategyMock.retrievedDictionary = nil
        
        super.tearDown()
    }
    
    func testStyleAs() {
        
        StyleStrategyMock.retrievedDictionary = ["font": "body",
                                                 "borderWidth": CGFloat(10.0)]
        
        // assert calling style(as:) will style based on style(styleSet:)
        let label = StylableLabelMock()
        label.layer.borderWidth = 1.0
        XCTAssertEqual(label.layer.borderWidth, 1.0)
        label.style(as: "someKey")
        XCTAssertEqual(label.layer.borderWidth, 10.0)
        
        // assert calling style(as:) will do additional styling
        XCTAssertEqual(label.calledAdditionalStyle, 1)
        
    }
    
    func testStyle() {
        
        StyleStrategyMock.retrievedDictionary = ["font": "body",
                                                 "borderWidth": CGFloat(10.0)]
        
        // assert calling style(as:) will style based on style(styleSet:)
        let label = StylableLabelMock()
        label.layer.borderWidth = 1.0
        XCTAssertEqual(label.layer.borderWidth, 1.0)
        
        //Use internal class so as to not trigger style on set
        label.style()
        label.styleInfo.styleKey = "someKey"
        label.style()
        XCTAssertEqual(label.layer.borderWidth, 10.0)
        
        // assert calling style(as:) will do additional styling
        XCTAssertEqual(label.calledAdditionalStyle, 1)
        
    }
    
}
