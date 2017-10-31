//
//  WelcomeViewController.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/31/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol WelcomeViewControllerDelegate: class {
    func welcomeViewControllerDidLoad(controller: WelcomeViewController)
    func welcomeViewControllerGetStartedButtonPressed(controller: WelcomeViewController)
}

public final class WelcomeViewController: UIViewController {

    public weak var delegate: WelcomeViewControllerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        delegate?.welcomeViewControllerDidLoad(controller: self)
    }

    @IBAction fileprivate func getStartedButtonPressed(_ sender: Any) {
        delegate?.welcomeViewControllerGetStartedButtonPressed(controller: self)
    }
}
