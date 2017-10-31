//
//  OnboardingCoordinator.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/31/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public final class OnboardingCoordinator: Coordinator, WelcomeViewControllerDelegate {
    
    fileprivate let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    public func start() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.delegate = self
    }
    
    //MARK:- WelcomeViewController
    
    public func welcomeViewControllerDidLoad(controller: WelcomeViewController) {
        
    }
    
    public func welcomeViewControllerGetStartedButtonPressed(controller: WelcomeViewController) {
        
        
    }
    
}
