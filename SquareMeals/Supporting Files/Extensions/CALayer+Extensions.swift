//
//  CALayer+Extensions.swift
//  Instagrowth
//
//  Created by Zachary Shakked on 1/11/16.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import UIKit

public extension CALayer {
    public var borderUIColor : UIColor {
        set {
            borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: borderColor!)
        }
    }
    
    public var shadowUIColor : UIColor {
        set {
            shadowColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: shadowColor!)
        }
    }
}
