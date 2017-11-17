//
//  MainCoordinator.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/14/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public final class MainCoordinator: Coordinator, MealPlanDayViewControllerDelegate, MealViewControllerDelegate {
    
    fileprivate let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    public func start() {
        
        
        let graphsViewController = UIViewController()
        graphsViewController.tabBarItem.image = #imageLiteral(resourceName: "stats")
        graphsViewController.tabBarItem.title = "Graphs"
        
        
        let mealsViewController = MealPlanDayViewController()
        mealsViewController.delegate = self
        mealsViewController.tabBarItem.image = #imageLiteral(resourceName: "meals_gray")
        mealsViewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "meals")
        
        let profileViewController = UIViewController()
        profileViewController.tabBarItem.image = #imageLiteral(resourceName: "user")
        profileViewController.tabBarItem.title = "Profile"
        
        let tabBarController = SMTabBarController(viewControllers: [graphsViewController, mealsViewController, profileViewController], selectedIndex: 1)
        
        rootViewController.present(tabBarController, animated: true, completion: nil)
    }

    
    //MARK:- MealPlanDayViewControllerDelegate
    
    public func mealPlanDayViewControllerDidLoad(controller: MealPlanDayViewController) {
        controller.meals = LocalMeal.samples()
        
    }
    
    public func mealPlanDayViewControllerShouldLoadMore(controller: MealPlanDayViewController) {
        
    }
    
    public func mealPlanDayViewControllerMealSelected(_ meal: Meal, controller: MealPlanDayViewController) {
        let mealViewController = MealViewController(meal: meal)
        mealViewController.delegate = self
        controller.present(mealViewController, animated: true, completion: nil)
    }
    
    //MARK:- MealViewControllerDelegate
    
    public func mealViewControllerDidLoad(controller: MealViewController) {
        
    }
    
    public func profileButtonPressed(controller: MealViewController) {
        
    }
    
    
}
