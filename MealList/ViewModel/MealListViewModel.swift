//
//  MealListViewModel.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/16/23.
//

import Foundation

class MealListViewModel {
    
    func fetchMeals(completion: @escaping ([Meal]?, CustomResponse?) -> Void) {
        APIManager.shared.fetchDessertMeals(endPoint: "filter.php?c=Dessert") {  (fetchedMeals, customResponse) in
            if var mealsFetched = fetchedMeals, mealsFetched.count > 0 {
                mealsFetched.sort()
                completion(mealsFetched, nil)
            } else if let mealsFetched = fetchedMeals, mealsFetched.count == 0 {
                completion(nil, CustomResponse(responseCode: -2, desc: "No Desserts Left"))
            } else {
                completion(nil, customResponse)
            }
        }
    }
    
    func fetchMealDetail(mealId: String, completion: @escaping (MealDetail?, CustomResponse?) -> ()) {
        APIManager.shared.fetchDessertMealDetail(endPoint: "lookup.php?i=" + mealId) {  (fetchedMealDetail, customResponse) in
            if let mealsDetailFetched = fetchedMealDetail, mealsDetailFetched.count > 0 {
                completion(mealsDetailFetched[0], nil)
            } else if let mealsDetailFetched = fetchedMealDetail, mealsDetailFetched.count > 0 {
                completion(nil, CustomResponse(responseCode: -2, desc: "No Detail Found"))
            } else {
                completion(nil, customResponse)
            }
        }
    }
}



