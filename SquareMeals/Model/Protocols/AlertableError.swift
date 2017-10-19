//
//  AlertableError.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/18/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol AlertableError {
    
    var title: String { get }
    var message: String { get }
    
    func createAlertController() -> UIAlertController
    
}

public extension AlertableError {
    
    public func createAlertController() -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okay)
        return alert
    }
    
}
