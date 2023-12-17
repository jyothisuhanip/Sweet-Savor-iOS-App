//
//  NetworkManager.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/14/23.
//

import Foundation
class APIManager {
    static let shared = APIManager()
    private init() {}
    let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    
    func fetchDessertMealDetail(endPoint: String, completion: @escaping ([MealDetail]?, CustomResponse?) -> Void) {
        guard let url = URL(string: baseURL + endPoint) else {
            completion(nil, CustomResponse(responseCode: -1, desc: "Can't Decode Data"))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
            guard let self = self else {
                completion(nil, CustomResponse(responseCode: -1, desc: "Can't Decode Data"))
                return
            }
            if httpResponse.statusCode == 200, error == nil {
                handleMealDetailData(data: data, completion: completion)
            } else {
                let customResponse: CustomResponse? = self.handleResponseCode(response: httpResponse)
                completion(nil, customResponse)
            }
        }.resume()
    }
    
    func fetchDessertMeals(endPoint: String, completion: @escaping ([Meal]?, CustomResponse?) -> Void) {
        guard let url = URL(string: baseURL + endPoint) else {
            completion(nil, CustomResponse(responseCode: -1, desc: "Can't Decode Data"))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
            guard let self = self else {
                completion(nil, CustomResponse(responseCode: -1, desc: "Can't Decode Data"))
                return
            }
            if httpResponse.statusCode == 200, error == nil  {
                handleMealsData(data: data, completion: completion)
            } else {
                let customResponse: CustomResponse? = self.handleResponseCode(response: httpResponse)
                completion(nil, customResponse)
            }
        }.resume()
    }
    
    func handleResponseCode(response: HTTPURLResponse) -> CustomResponse? {
        let customResponse: CustomResponse = CustomResponse(responseCode: response.statusCode, desc: HTTPURLResponse.localizedString(forStatusCode: response.statusCode))
        return customResponse
    }
    
    func handleMealsData(data: Data?, completion: @escaping ([Meal]?, CustomResponse?) -> Void) {
        if let jsonData = data {
            do {
                let decoder = JSONDecoder()
                let mealsResponse = try decoder.decode(MealsResponse.self, from: jsonData)
                let meals = mealsResponse.meals
                completion(meals, nil)
            } catch {
                completion(nil, CustomResponse(responseCode: -1, desc: "Can't Decode Data"))
            }
        }
    }
    
    func handleMealDetailData(data: Data?, completion: @escaping ([MealDetail]?, CustomResponse?) -> Void) {
        if let jsonData = data {
            do {
                let decoder = JSONDecoder()
                let mealsResponse = try decoder.decode(MealDetailResponse.self, from: jsonData)
                let meals = mealsResponse.meals
                completion(meals, nil)
            } catch {
                completion(nil, CustomResponse(responseCode: -1, desc: "Can't Decode Data"))
            }
        }
    }
}
