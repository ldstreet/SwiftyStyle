//
//  StyleManager.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/1/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    internal static var swiftyStyleUpdate: NSNotification.Name = NSNotification.Name.init("swiftyStyleUpdate")
}

public class StyleManager {
    
    private var verticalSizeClassObserver: NSKeyValueObservation?
    private var horizontalSizeClassObserver: NSKeyValueObservation?
    
    public var shared = StyleManager()
    private init() {
        verticalSizeClassObserver = UIApplication.shared.keyWindow?.rootViewController?.traitCollection.observe(\.verticalSizeClass) { vc, change in
            StyleManager.styleAllControls()
        }
        horizontalSizeClassObserver = UIApplication.shared.keyWindow?.rootViewController?.traitCollection.observe(\.horizontalSizeClass) { vc, change in
            StyleManager.styleAllControls()
        }
    }
    
    internal static var swiftyStyleNotificationManager = NotificationCenter()
    
    public static func styleAllControls() {
        swiftyStyleNotificationManager.post(name: .swiftyStyleUpdate, object: nil)
    }
    
}
