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

    public func saveUserInfo(_ userInfo: UserInfo, completion: @escaping (Bool, AlertableError?, User?) -> ()) -> Operation {
        
        let record: CKRecord = user.record
        
        if let firstName = userInfo.firstName {
            record[User.Fields.firstName] = firstName as CKRecordValue
        }
        if let lastName = userInfo.lastName {
            record[User.Fields.lastName] = lastName as CKRecordValue
        }
        if let birthday = userInfo.birthday {
            record[User.Fields.birthday] = birthday as CKRecordValue
        }
        if let weight = userInfo.weight {
            record[User.Fields.weight] = weight as CKRecordValue
        }
        if let height = userInfo.height {
            record[User.Fields.height] = height as CKRecordValue
        }
        if let measuringSystem = userInfo.measuringSystem {
            record[User.Fields.measuringSystem] = measuringSystem as CKRecordValue
        }
        
        return saveRecord(record: record, completion: completion)
    }
    
    public func saveRecord<T: CKWrapper>(record: CKRecord, completion: @escaping (Bool, AlertableError?, T?) -> ()) -> Operation {
        
        let saveOperation = CKModifyRecordsOperation(recordsToSave: [record], recordIDsToDelete: nil)
        saveOperation.qualityOfService = .userInitiated
        saveOperation.modifyRecordsCompletionBlock = { records, _, error in
            
            guard let record = records?.first, error == nil else {
                completion(false, CKError(error: error), nil)
                return
            }
            
            completion(true, nil, T(record: record))
        }
        CKContainer.default().publicCloudDatabase.add(saveOperation)
        return saveOperation
    }
    
    public func saveRecords<T: CKWrapper>(records: [CKRecord], completion: @escaping (Bool, AlertableError?, [T]?) -> ()) -> Operation {
        
        let saveOperation = CKModifyRecordsOperation(recordsToSave: records, recordIDsToDelete: nil)
        saveOperation.qualityOfService = .userInitiated
        saveOperation.modifyRecordsCompletionBlock = { records, _, error in
            
            guard let records = records, error == nil else {
                completion(false, CKError(error: error), nil)
                return
            }
        
            completion(true, nil, records.map(T.init))
        }
        CKContainer.default().publicCloudDatabase.add(saveOperation)
        return saveOperation
    }
    

    
}
