//
//  Meal.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/14/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol Meal {

    var coverImage: UIImage { get }
    var calories: Double { get }
    var carbohydrates: Double { get }
    var protein: Double { get }
    var fats: Double { get }
    
}
