//
//  StylableLabelMock.swift
//  SwiftyStyleTests
//
//  Created by Luke Street on 11/21/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit
import SwiftyStyle

internal class StylableLabelMock: UILabel, Stylable, StylableAdditional {
    
    internal var styleInfo = StyleInfo()
    
    internal typealias Strategy = StyleStrategyMock
    
    internal var calledAdditionalStyle: Int = 0
    
    func additionalStyle(styleSet: StyleSet) {
        calledAdditionalStyle += 1
    }
    
}
