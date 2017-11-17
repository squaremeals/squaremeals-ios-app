//
//  MealTableViewCell.swift
//  SquareMeals
//
//  Created by Gregory Johnson on 10/24/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public final class MealTableViewCell: UITableViewCell, ReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    
    public func configure(for meal: Meal) {
        
        titleLabel.text = meal.label.uppercased()
        coverImageView.image = meal.coverImage
        caloriesLabel.text = String(format: "%.0f", meal.calories)
        carbsLabel.text = String(format: "%.0f", meal.carbohydrates)
        fatsLabel.text = String(format: "%.0f", meal.fats)
        
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
        caloriesLabel.text = ""
        carbsLabel.text = ""
        fatsLabel.text = ""
    }
    
    public override func awakeFromNib() {
        coverImageView.image = nil
        selectionStyle = .none
    }
    
    
}
