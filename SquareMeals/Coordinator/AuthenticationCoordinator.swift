//
//  AuthenticationCoordinator.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/24/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol AuthenticationCoordinatorDelegate: class {
    func authenticationCoordinatorSucceeded(service: CloudKitService)
}

public final class AuthenticationCoordinator: Coordinator, LoadingViewControllerDelegate {
    
    public weak var delegate: AuthenticationCoordinatorDelegate?
    
    fileprivate let rootViewController: UIViewController
    
    public init(rootViewController: UIViewController, delegate: AuthenticationCoordinatorDelegate) {
        self.rootViewController = rootViewController
        self.delegate = delegate
    }
    
    public func start() {
        let loadingViewController = LoadingViewController()
        loadingViewController.delegate = self
        rootViewController.present(loadingViewController, animated: true, completion: nil)
    }
    
    //MARK:- LoadingViewControllerDelegate
    
    public func loadingViewControllerDidLoad(controller: LoadingViewController) {
        attemptCloudKitAuthentication(loadingViewController: controller)
    }
    
    public func loadingViewControllerTryAgainButtonPressed(controller: LoadingViewController) {
        attemptCloudKitAuthentication(loadingViewController: controller)
    }
    
    func attemptCloudKitAuthentication(loadingViewController: LoadingViewController) {
        loadingViewController.state = .loading
        CloudKitService.create { (succeeded, error, service) in
            DispatchQueue.main.async {
                
                guard let service = service, error == nil else {
                    loadingViewController.state = .iCloudError
                    return
                }
                
                self.delegate?.authenticationCoordinatorSucceeded(service: service)
            }
        }
    }
    
}
