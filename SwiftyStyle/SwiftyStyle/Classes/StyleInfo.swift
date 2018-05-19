//
//  StyleInfo.swift
//  SwiftyStyle
//
//  Created by Luke Street on 11/12/17.
//  Copyright © 2017 com.ldstreet. All rights reserved.
//

import UIKit

/**
 This class holds all info that needs to be stored. For now, this is only the styleKey which allows the control to be re-styled and and a observer for the style update notifications which is called by the StyleManager's styleAllControls() function
 */
public final class StyleInfo {

    /**
     Style key stored and used for re-styling
    */
    internal var styleKey: StyleKeyProtocol?
    
    /**
     Weak reference back to stylable control for re-styling on events recieved from StyleManager
    */
    private weak var stylable: (SwiftyStyleProtocol & SwiftyStyleInfoProtocol)?
    
    /**
     Used to attach stylable to control for re-styling
    */
    internal func attach(stylable: SwiftyStyleProtocol & SwiftyStyleInfoProtocol) {
        if self.stylable == nil {
            self.stylable = stylable
        }
    }
    
    /**
     Empty init that adds observer for re-styling events
    */
    public init() {
        StyleManager.swiftyStyleNotificationManager.addObserver(forName: .swiftyStyleUpdate, object: nil, queue: nil) { [weak self] _ in
            self?.stylable?.style()
        }
    }
    
    /**
     On denit remove observer for re-style events
    */
    deinit {
        StyleManager.swiftyStyleNotificationManager.removeObserver(self)
    }
    
}
