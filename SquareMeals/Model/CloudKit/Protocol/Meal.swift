//
//  Meal.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/14/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol Meal {

    var label: String { get }
    var coverImage: UIImage { get }
    var calories: Double { get }
    var carbohydrates: Double { get }
    var protein: Double { get }
    var fats: Double { get }
    var name: String { get }
    var description: String { get }
    var ingredients: String { get }
    
}
