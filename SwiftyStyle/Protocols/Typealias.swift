//
//  Typealias.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/12/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

//MARK: - Composite Protocols

/**
 Complete set of Stylable protocols. Conforming a base class to Stylable will give class ability to style and be re-styled at any given time. This also will allow you to use the StyleManager to re-style all living controls at any given time. Use this class if possible, but remember it will require you either to subclass, or to use some other work around in order to store the StyleInfo object
 */
public typealias Stylable = SwiftyStyleProtocol & SwiftyStyleInfoProtocol & SwiftyStyleSetRetrieverProtocol

/**
 Basic set of Stylable protocols. Because this set uses SwiftyStyleBasicKeyProtocol, controls will not have the ability to be re-styled, this means that a control will only be styled when the styleKey has been set. If done through the storyboard, this will be when the control is loaded. The key is not stored, and thus it cannot be reapplied later on. Use StylableBasic if you can't subclass and only need your controls to be styled once.
 */
public typealias StylableBasic = SwiftyStyleProtocol & SwiftyStyleSetRetrieverProtocol

/**
 If you need your subclass to live at a lower-level (perhaps a common framework) but need to implement the style trategy and styling protocols at a higher level, use these protocols.  StylableBase will allow you to store the StyleInfo object in your base class.
 */
public typealias StylableBase = SwiftyStyleInfoProtocol

/**
 Conform to this protocol at a higher level than StylableBase in order to set a strategy and define style functions
 */
public typealias StylableExtension = SwiftyStyleProtocol & SwiftyStyleSetRetrieverProtocol

/**
 Includes SwiftyAdditionalStyleProtocol to setup any additional styling not set up by SwiftyStyleProtocol
 */
public typealias StylableAdditional = SwiftyAdditionalStyleProtocol
