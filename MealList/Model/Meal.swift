//
//  Meal.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/14/23.
//

import Foundation

struct MealsResponse: Codable {
    let meals: [Meal]
}


struct Meal: Codable, Comparable {
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
    
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        if let lhsMeal = lhs.strMeal, let rhsMeal = rhs.strMeal {
            return lhsMeal < rhsMeal
        }
        return false
    }
}
