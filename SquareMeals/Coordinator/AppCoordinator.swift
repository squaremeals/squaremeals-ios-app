//
//  AppCoordinator.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/24/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public final class AppCoordinator: Coordinator, AuthenticationCoordinatorDelegate {
    
    fileprivate let rootViewController: UIViewController
    
    fileprivate var authenticationCoordinator: AuthenticationCoordinator?
    fileprivate var mainCoordinator: MainCoordinator?
    
    public init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    public func start() {
        mainCoordinator = MainCoordinator(rootViewController: rootViewController)
        mainCoordinator?.start()
        
//        authenticationCoordinator = AuthenticationCoordinator(rootViewController: rootViewController, delegate: self)
//        authenticationCoordinator?.start()
    }
    
    //MARK:- AuthenticationCoordinator
    
    public func authenticationCoordinatorSucceeded(service: CloudKitService) {
        print("CloudKit Service Established: \(service)")
        
        let alert = UIAlertController(title: "iCloud Service Established", message: "The iCloud Service has been established.", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okay)
        
        rootViewController.presentedViewController?.present(alert, animated: true, completion: nil)
    }
    
    
    
}
