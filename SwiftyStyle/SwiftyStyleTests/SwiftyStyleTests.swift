//
//  SwiftyStyleTests.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 10/29/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import XCTest
import UIKit
@testable import SwiftyStyle

typealias PlistStrategy = PlistStyleStrategy<HexColorSet, PreferredFontSet>

class SwiftyStyleTests: XCTestCase {
    
//    class LSButton: UIButton, Stylable {
//        var styleInfo = StyleInfo()
//        typealias Strategy = PlistStrategy
//    }
    
    override func setUp() {
        super.setUp()
        PlistStrategy.setPlist(forType: StylePlistType.defaultPlist, plistName: "StyleMap", bundle: Bundle(for: type(of: self)))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        //let button = LSButton()
        //button.styleKey = "StyleOne"
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
