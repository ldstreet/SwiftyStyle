//
//  StyleManagerTests.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 11/21/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import XCTest
import UIKit
@testable import SwiftyStyle

class StyleManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        StyleStrategyMock.retrieveStyleSetCount = 0
    }
    
    func testStyleAllControls() {
        XCTAssertEqual(StyleStrategyMock.retrieveStyleSetCount, 0)
        let label = StylableLabelMock()
        label.styleKey = "anything"
        XCTAssertEqual(StyleStrategyMock.retrieveStyleSetCount, 1)
        StyleManager.styleAllControls()
        XCTAssertEqual(StyleStrategyMock.retrieveStyleSetCount, 2)
    }
    
}
