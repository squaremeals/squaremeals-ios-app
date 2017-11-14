//
//  LocalMeal.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/14/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public struct LocalMeal: Meal {
    
    public let coverImage: UIImage
    public let calories: Double
    public let carbohydrates: Double
    public let protein: Double
    public let fats: Double
    
    static func samples() -> [Meal] {
        
        
        
        return [
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            LocalMeal(coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 128.2, protein: 80.3, fats: 40.3),
            
        ]
    }

}


