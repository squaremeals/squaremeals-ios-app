//
//  MainCoordinator.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/14/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public final class MainCoordinator: Coordinator, MealPlanDayViewControllerDelegate {
    
    fileprivate let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    public func start() {
        let tabBarController = UITabBarController()
        
        let graphsViewController = UIViewController()
        graphsViewController.tabBarItem.image = #imageLiteral(resourceName: "Graphs")
        graphsViewController.tabBarItem.title = "Graphs"
        
        
        let mealsViewController = MealPlanDayViewController()
        mealsViewController.delegate = self
        let mealsNavigationController = UINavigationController(rootViewController: mealsViewController)
        
        mealsNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Meal")
        mealsNavigationController.tabBarItem.title = "Meals"
        
        let profileViewController = UIViewController()
        profileViewController.tabBarItem.image = #imageLiteral(resourceName: "Profile")
        profileViewController.tabBarItem.title = "Profile"
        
        tabBarController.viewControllers = [graphsViewController, mealsNavigationController, profileViewController]
        tabBarController.selectedIndex = 1
        
        rootViewController.present(tabBarController, animated: true, completion: nil)
    }

    
    public func mealPlanDayViewControllerDidLoad(controller: MealPlanDayViewController) {
        controller.meals = LocalMeal.samples()
        
    }
    
    public func mealPlanDayViewControllerShouldLoadMore(controller: MealPlanDayViewController) {
        
    }
}
