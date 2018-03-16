//
//  SwiftyStyleBasicKeyProtocol.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/12/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

/**
 Conform to this protocol if your control does not need to be re-styled
 throughout the app's lifecycle. When conforming to this protocol, style() will
 be called only once when the the styleKey is set.
 */
public protocol SwiftyStyleBasicKeyProtocol: class {
    
    /**
     **This key will not be stored with the control when using default implementation provided in UIView extension.** On set, control will be styled using SwiftyStyleProtocol. On get, nil will always be returned.
    */
    var styleKey: StyleKeyProtocol? { get set }
    
}
