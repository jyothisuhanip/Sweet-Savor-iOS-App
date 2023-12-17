//
//  MealListView.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/14/23.
//


import SwiftUI

struct MealListView: View {
    @State private var meals: [Meal] = []
    @State private var customResponse: CustomResponse?
    private let mealListViewModel: MealListViewModel = MealListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if(meals.count > 0) {
                    ScrollView {
                        VStack {
                            ForEach(meals, id: \.idMeal) { meal in
                                VStack {
                                    if let id = meal.idMeal {
                                        NavigationLink(destination: MealDetailView(mealId: id, mealDetailViewModel: mealListViewModel)) {
                                            BoxView(meal: meal)
                                        }
                                    }
                                }.padding(.top, 16)
                            }
                        }
                    }
                } else {
                    ErrorView(response: customResponse ?? CustomResponse(responseCode: -30, desc: "Loading ...."))
                }
            }.navigationTitle("Dessert Meals")
                .background(Color.white)
                .navigationBarBackButtonHidden(false)
                .onAppear {
                    mealListViewModel.fetchMeals { (mealsFetched, response) in
                        if let mealData = mealsFetched {
                            meals = mealData
                        } else {
                            if let customResponseFetched = response {
                                customResponse = customResponseFetched
                            }
                        }
                    }
                }
            
        }
    }
    
}


