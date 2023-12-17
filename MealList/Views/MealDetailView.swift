//
//  MealDetailView.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/14/23.
//

import SwiftUI

struct MealDetailView: View {
    let mealId: String
    @State private var mealDetail: MealDetail?
    @State private var customResponse: CustomResponse?
    let mealDetailViewModel: MealListViewModel
    
    var body: some View {
        VStack {
            if let _ = mealDetail {
                VStack(alignment: .leading) {
                    if let strMeal = mealDetail?.strMeal {
                        Text("Meal: \(strMeal)").padding()
                    }
                    if let drinkAlternate = mealDetail?.strDrinkAlternate, !drinkAlternate.isEmpty {
                        Text("Drink Alternate:  \(drinkAlternate)").padding()
                    }
                    
                    if let category = mealDetail?.strCategory, !category.isEmpty {
                        Text("Category: \(category)").padding()
                    }
                    
                    if let area = mealDetail?.strArea, !area.isEmpty {
                        Text("Area: \(area)").padding()          }
                    
                    if let instructions = mealDetail?.strInstructions, !instructions.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Instructions: ").bold().padding()
                            Text(instructions).padding()
                        }
                    }
                    
                    IngredientsView(mealDetail: mealDetail).padding().multilineTextAlignment(.leading)
                }
            } else {
                ErrorView(response: customResponse ?? CustomResponse(responseCode: -30, desc: "Loading ...."))
            }
        }
        .frame(alignment: .leading)
        .navigationBarTitle(mealDetail?.strMeal ?? "Meal Detail", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
        .onAppear() {
            mealDetailViewModel.fetchMealDetail(mealId: mealId) { (mealDetailFetched, response) in
                if let _ = mealDetailFetched {
                    mealDetail = mealDetailFetched
                } else {
                    if let customResponseFetched = response {
                        customResponse = customResponseFetched
                    }
                }
            }
        }
    }
}

struct IngredientsView: View {
    var mealDetail: MealDetail?
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients: ").padding()
            HStack {
                if let ingredient1 = mealDetail?.strIngredient1, !ingredient1.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient1)
                }
                if let measure1 = mealDetail?.strMeasure1, !measure1.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure1)")
                }
            }
            HStack {
                if let ingredient2 = mealDetail?.strIngredient2, !ingredient2.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient2)
                }
                if let measure2 = mealDetail?.strMeasure2, !measure2.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure2)")
                }
            }
            HStack {
                if let ingredient3 = mealDetail?.strIngredient3, !ingredient3.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient3)
                }
                if let measure3 = mealDetail?.strMeasure3, !measure3.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure3)")
                }
            }
            HStack {
                if let ingredient4 = mealDetail?.strIngredient4, !ingredient4.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient4)
                }
                if let measure4 = mealDetail?.strMeasure4, !measure4.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure4)")
                }
            }
            
            HStack {
                if let ingredient5 = mealDetail?.strIngredient5, !ingredient5.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient5)
                }
                if let measure5 = mealDetail?.strMeasure5, !measure5.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure5)")
                }
            }
            
            HStack {
                if let ingredient6 = mealDetail?.strIngredient6, !ingredient6.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient6)
                }
                if let measure6 = mealDetail?.strMeasure6, !measure6.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure6)")
                }
            }
            
            HStack {
                if let ingredient7 = mealDetail?.strIngredient7, !ingredient7.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient7)
                }
                if let measure7 = mealDetail?.strMeasure7, !measure7.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure7)")
                }
            }
            
            HStack {
                if let ingredient8 = mealDetail?.strIngredient8, !ingredient8.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient8)
                }
                if let measure8 = mealDetail?.strMeasure8, !measure8.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure8)")
                }
            }
            
            HStack {
                if let ingredient9 = mealDetail?.strIngredient9, !ingredient9.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient9)
                }
                if let measure9 = mealDetail?.strMeasure9, !measure9.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure9)")
                }
            }
            
            HStack {
                if let ingredient10 = mealDetail?.strIngredient10, !ingredient10.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient10)
                }
                if let measure10 = mealDetail?.strMeasure10, !measure10.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure10)")
                }
            }
            
            HStack {
                if let ingredient11 = mealDetail?.strIngredient11, !ingredient11.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient11)
                }
                if let measure11 = mealDetail?.strMeasure11, !measure11.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure11)")
                }
            }
            
            HStack {
                if let ingredient12 = mealDetail?.strIngredient12, !ingredient12.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient12)
                }
                if let measure12 = mealDetail?.strMeasure12, !measure12.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure12)")
                }
            }
            
            HStack {
                if let ingredient13 = mealDetail?.strIngredient13, !ingredient13.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient13)
                }
                if let measure13 = mealDetail?.strMeasure13, !measure13.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure13)")
                }
            }
            
            HStack {
                if let ingredient14 = mealDetail?.strIngredient14, !ingredient14.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient14)
                }
                if let measure14 = mealDetail?.strMeasure14, !measure14.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure14)")
                }
            }
            
            HStack {
                if let ingredient15 = mealDetail?.strIngredient15, !ingredient15.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient15)
                }
                if let measure15 = mealDetail?.strMeasure15, !measure15.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure15)")
                }
            }
            
            HStack {
                if let ingredient16 = mealDetail?.strIngredient16, !ingredient16.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient16)
                }
                if let measure16 = mealDetail?.strMeasure16, !measure16.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure16)")
                }
            }
            
            HStack {
                if let ingredient17 = mealDetail?.strIngredient17, !ingredient17.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient17)
                }
                if let measure17 = mealDetail?.strMeasure17, !measure17.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure17)")
                }
            }
            
            HStack {
                if let ingredient18 = mealDetail?.strIngredient18, !ingredient18.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient18)
                }
                if let measure18 = mealDetail?.strMeasure18, !measure18.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure18)")
                }
            }
            
            HStack {
                if let ingredient19 = mealDetail?.strIngredient19, !ingredient19.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient19)
                }
                if let measure19 = mealDetail?.strMeasure19, !measure19.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure19)")
                }
            }
            
            HStack {
                if let ingredient20 = mealDetail?.strIngredient20, !ingredient20.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(ingredient20)
                }
                if let measure20 = mealDetail?.strMeasure20, !measure20.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(": \(measure20)")
                }
            }
            
        }
    }
    
}
