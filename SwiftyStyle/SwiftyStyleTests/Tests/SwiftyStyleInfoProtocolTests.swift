//
//  TypealiasTests.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 11/21/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import XCTest
import UIKit
@testable import SwiftyStyle

class SwiftyStyleInfoProtocolTests: XCTestCase {
    func testStyleKey() {
        let stylableLabel = StylableLabelMock()
        stylableLabel.styleKey = "someKey"
        XCTAssertEqual(stylableLabel.styleInfo.styleKey?.rawValue, "someKey")
        stylableLabel.styleInfo.styleKey? = "anotherKey"
        XCTAssertEqual(stylableLabel.styleKey?.rawValue, "anotherKey")
    }
}
