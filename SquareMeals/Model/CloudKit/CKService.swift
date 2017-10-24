//
//  CloudKitService.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/11/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import Foundation
import CloudKit

public final class CloudKitService {
    
    public let user: User
    
    fileprivate init(user: User) {
        self.user = user
    }
    
    static func create(completion: @escaping (Bool, AlertableError?, CloudKitService?) -> ()) {
        
        CKContainer.default().accountStatus { (status, error) in
            
            guard error == nil else {
                completion(false, CKError(error: error), nil)
                return
            }
            
            CKContainer.default().fetchUserRecordID { (userRecordID, error) in
                
                guard let userRecordID = userRecordID, error == nil else {
                    completion(false, CKError(error: error), nil)
                    return
                }
                
                CKContainer.default().publicCloudDatabase.fetch(withRecordID: userRecordID) { (record, error) in
                    
                    guard let userRecord = record, error == nil else {
                        completion(false, CKError(error: error), nil)
                        return
                    }
                    let user = User(record: userRecord)
                    let cloudKitService = CloudKitService(user: user)
                    
                    print("User: \(user)")
                    
                    completion(true, nil, cloudKitService)
                }
            }
        }
        
    }
    
    
    
}
