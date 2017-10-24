//
//  User.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/24/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import Foundation
import CloudKit

public struct User: CKWrapper {
    
    public let record: CKRecord
    
    public enum Fields: CKFields {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let birthday = "birthday"
        static let weight = "weight"
        static let height = "height"
        static let measuringSystem = "measuringSystem"
    }
    
    public var firstName: String? { return record[Fields.firstName] as? String }
    public var lastName: String? { return record[Fields.lastName] as? String }
    public var birthday: Date? { return record[Fields.birthday] as? Date }
    public var weight: Int? { return record[Fields.weight] as? Int }
    public var height: Int? { return record[Fields.height] as? Int }
    public var measuringSystem: String? { return record[Fields.measuringSystem] as? String }
    
}

