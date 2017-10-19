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
    
    public let userRecordID: CKRecordID
    
    fileprivate init(userRecordID: CKRecordID) {
        self.userRecordID = userRecordID
    }
    
    static func create(completion: @escaping (Bool, AlertableError?, CloudKitService?) -> ()) {
        
        CKContainer.default().accountStatus { (status, error) in
            
            if let error = CKError(accountStatus: status) {
                completion(false, error, nil)
                return
            }
            
            CKContainer.default().fetchUserRecordID { (userRecordID, error) in
                
                guard let userRecordID = userRecordID, error == nil else {
                    completion(false, CKError(error: error), nil)
                    return
                }
                
                let cloudKitService = CloudKitService(userRecordID: userRecordID)
                completion(true, nil, cloudKitService)
            }
        }
        
    }
    
    
    
}
