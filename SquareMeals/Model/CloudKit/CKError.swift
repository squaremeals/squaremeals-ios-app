//
//  CloudKitError.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/11/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit
import CloudKit

public enum CKError: AlertableError {
    
    case networkUnreachable
    case couldntDetermine
    case cloudKitDisabled
    case cloudKitRestricted
    
    init?(accountStatus: CKAccountStatus) {
        switch accountStatus {
        case .available:
            return nil
        case .couldNotDetermine:
            self = .couldntDetermine
        case .noAccount:
            self = .cloudKitDisabled
        case .restricted:
            self = .cloudKitRestricted
        }
    }
    
    init?(error: Error?) {
        guard let error = error else {
            return nil
        }
        debugPrint(error)
        self = .networkUnreachable
    }
    
    public var title: String {
        switch self {
        case .networkUnreachable:
            return "Network Unreachable"
        case .cloudKitRestricted:
            return "iCloud Restricted"
        case .couldntDetermine:
            return "Couldn't Determine iCloud Status"
        case .cloudKitDisabled:
            return "iCloud Disabled"
        }
    }
    
    public var message: String {
        switch self {
        case .networkUnreachable:
            return "We cannot communicate with the network. Please try again."
        case .cloudKitRestricted:
            return "Your iCloud is parentally restricted from using our app. Please contact your parent or guardian to fix this status."
        case .couldntDetermine:
            return "We could not determine your iCloud status. Please try again."
        case .cloudKitDisabled:
            return "You must be logged into iCloud and have iCloud Drive enabled for 'SquareMeals' to use this application. Please open iCloud settings and fix this, then retry our app."
        }
    }
    
    
}

