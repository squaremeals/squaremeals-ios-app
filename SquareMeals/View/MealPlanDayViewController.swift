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
    func mealPlanDayViewControllerShouldLoadMore(controller: MealPlanDayViewController)
}

public final class MealPlanDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    public weak var delegate: MealPlanDayViewControllerDelegate?
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    public var meals: [Meal] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Meal Plan"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(type: MealTableViewCell.self)
        
        delegate?.mealPlanDayViewControllerDidLoad(controller: self)
        
    }
    
    public func startLoading() {
        
    }
    
    public func stopLoading() {
        
    }
    
    //MARK:- UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MealTableViewCell = tableView.dequeueCell(for: indexPath)
        let meal = meals[indexPath.row]
        cell.configure(for: meal)
        
        if indexPath.row == meals.count - 1 {
            delegate?.mealPlanDayViewControllerShouldLoadMore(controller: self)
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
