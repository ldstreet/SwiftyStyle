//
//  StyleManager.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/1/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    /**
     Defines name of notification used to re-style all stylable controls. Internal use only.
    */
    internal static var swiftyStyleUpdate: NSNotification.Name = NSNotification.Name("swiftyStyleUpdate")
}

public class StyleManager {
    
    //Observe vertical size class
    private var verticalSizeClassObserver: NSKeyValueObservation?
    
    //Observer horizontal size lcass
    private var horizontalSizeClassObserver: NSKeyValueObservation?
    
    /**
     Singleton
    */
    public var shared = StyleManager()
    
    //Private init to make true singleton
    private init() {
        verticalSizeClassObserver = UIApplication.shared.keyWindow?.rootViewController?.traitCollection.observe(\.verticalSizeClass) { vc, change in
            StyleManager.styleAllControls()
        }
        horizontalSizeClassObserver = UIApplication.shared.keyWindow?.rootViewController?.traitCollection.observe(\.horizontalSizeClass) { vc, change in
            StyleManager.styleAllControls()
        }
    }
    
    //Internal notification center used for re-styling controls
    internal static var swiftyStyleNotificationManager = NotificationCenter()
    
    /**
     Posts an event to re-style all controls conforming to SwiftyStyleInfoProtocol and SwiftyStyleProtocol
    */
    public static func styleAllControls() {
        swiftyStyleNotificationManager.post(name: .swiftyStyleUpdate, object: nil)
    }
    
}
