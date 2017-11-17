//
//  UntintedButton.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/16/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public class UntintedButton: UIButton {
    
    override public func setImage(_ image: UIImage?, for state: UIControlState) {
        let newImage = image?.withRenderingMode(.alwaysOriginal)
        super.setImage(newImage, for: state)
    }
    
}

