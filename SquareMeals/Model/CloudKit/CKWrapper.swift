//
//  CKWrapper.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/11/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit
import CloudKit

public protocol CKWrapper {
    
    var record: CKRecord { get }
    var creationDate: Date? { get }
    var modificationDate: Date? { get }
    
}

public extension CKWrapper {
    
    public var creationDate: Date? {
        return record.creationDate
    }
    
    public var modificationDate: Date? {
        return record.modificationDate
    }
    
}
