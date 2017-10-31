//
//  MealPlanDayViewController.swift
//  SquareMeals
//
//  Created by Gregory Johnson on 10/18/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol MealPlanDayViewControllerDelegate: class {
    func mealPlanDayViewControllerDidLoad(controller: MealPlanDayViewController)
    
}

public final class MealPlanDayViewController: UIViewController {

    public weak var delegate: MealPlanDayViewControllerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        delegate?.mealPlanDayViewControllerDidLoad(controller: self)
    }
}
