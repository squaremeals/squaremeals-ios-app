//
//  CKFields.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/11/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import Foundation

public protocol CKFields {
    static var creationDate: String { get }
    static var modificationDate: String { get }
}

public extension CKFields {
    
    public static var creationDate: String { return "creationDate" }
    public static var modificationDate: String { return "modificationDate" }
    
}
