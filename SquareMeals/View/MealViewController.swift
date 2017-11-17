//
//  MealViewController.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/16/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol MealViewControllerDelegate:class {
    func mealViewControllerDidLoad(controller: MealViewController)
    func profileButtonPressed(controller: MealViewController)
}

public final class MealViewController: UIViewController {

    public let meal: Meal
    public weak var delegate: MealViewControllerDelegate?
    
    public init(meal: Meal) {
        self.meal = meal
        super.init(nibName: "MealViewController", bundle: Bundle.main)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var coverImageView: UIImageView!
    @IBOutlet fileprivate weak var caloriesLabel: UILabel!
    @IBOutlet fileprivate weak var proteinLabel: UILabel!
    @IBOutlet fileprivate weak var carbsLabel: UILabel!
    @IBOutlet fileprivate weak var fatsLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var mealTitle: UILabel!
    @IBOutlet fileprivate weak var profileButton: UIButton!
    @IBOutlet fileprivate weak var descriptionLabel: UILabel!
    @IBOutlet fileprivate weak var ingredientsLabel: UILabel!
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        delegate?.profileButtonPressed(controller: self)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = meal.name.capitalized
        coverImageView.image = meal.coverImage
        caloriesLabel.text = String(format: "%.0f", meal.calories)
        carbsLabel.text = String(format: "%.0f", meal.carbohydrates)
        fatsLabel.text = String(format: "%.0f", meal.fats)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateLabel.text = "Today, \(dateFormatter.string(from: Date()))"
        descriptionLabel.text = meal.description
        ingredientsLabel.text = meal.ingredients
        
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
