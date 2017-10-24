//
//  AppDelegate.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/24/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
public final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
    
    fileprivate var appCoordinator: AppCoordinator?

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let rootViewController: UIViewController = UIViewController()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = rootViewController
        
        self.appCoordinator = AppCoordinator(rootViewController: rootViewController)
        appCoordinator?.start()
        
        return true
    }
}
