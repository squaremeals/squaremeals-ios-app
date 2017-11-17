//
//  LocalMeal.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/14/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public struct LocalMeal: Meal {
    
    public let name: String
    public let label: String
    public let coverImage: UIImage
    public let calories: Double
    public let carbohydrates: Double
    public let protein: Double
    public let fats: Double
    public let description: String
    public let ingredients: String
    
    
    static func samples() -> [Meal] {
        
        
        
        return [
            LocalMeal(name: "Bison Burger", label: "Breakfast", coverImage: #imageLiteral(resourceName: "breakfast"), calories: 489.3, carbohydrates: 42.0, protein: 24.0, fats: 11.0, description: "The Bison Burger is a classic American staple. We love this burger paired with some classic fixings such as onion and tomato", ingredients: "1lb Ground Bison1 Full \nTomato\nBrioche Buns"),
            LocalMeal(name: "Ass", label: "Lunch", coverImage: #imageLiteral(resourceName: "lunch"), calories: 705.0, carbohydrates: 70.3, protein: 42.0, fats: 18.0, description: "The Bison Burger is a classic American staple. We love this burger paired with some classic fixings such as onion and tomato", ingredients: "1lb Ground Bison1 Full \nTomato\nBrioche Buns"),
            LocalMeal(name: "Pancakes", label: "Dinner", coverImage: #imageLiteral(resourceName: "dinner"), calories: 910, carbohydrates: 90.2, protein: 50.2, fats: 22.0, description: "The Bison Burger is a classic American staple. We love this burger paired with some classic fixings such as onion and tomato", ingredients: "1lb Ground Bison1 Full \nTomato\nBrioche Buns"),
        ]
    }

}


