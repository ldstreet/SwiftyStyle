//
//  SwiftyAdditionalStyleProtocol.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/12/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

/**
 Conform to this protocol for any additional styling not covered by default style() functions. If you are doing something special with a control that already conforms to SwiftyStyleProtocol then use this protocol to do additional stlying. additionalStyle(styleSet: StyleSet) will be
 */
public protocol SwiftyAdditionalStyleProtocol: class {
    
    /**
     Called after style(styleSet: StyleSet) is called inside style(as key: String) to do any custom styling not defined by default styling implementations
     */
    func additionalStyle(styleSet: StyleSet)
    
}
