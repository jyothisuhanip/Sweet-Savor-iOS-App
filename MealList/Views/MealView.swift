//
//  MealView.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/15/23.
//

import SwiftUI


struct MealView: View {
    var meal: Meal

    var body: some View {
        VStack {
            if let imageUrl = meal.strMealThumb, let url = URL(string: imageUrl) {
                AsyncImageView(url: url)
            }
            
            if let mealName = meal.strMeal {
                Text(mealName).padding(12)
            }
            
        }
    }
}

struct BoxView: View {
    var meal: Meal
    var body: some View {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width-32, height: UIScreen.main.bounds.width + 24 )
                .shadow(color: Color.black.opacity(0.5), radius: 2).overlay(alignment: .center) {
                    MealView(meal: meal)
                }.padding(8)
            
    }
}


struct AsyncImageView: View {
    @StateObject private var imageLoader: ImageLoader
    let url: URL

    init(url: URL) {
        self.url = url
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        Group {
            switch imageLoader.state {
            case .empty, .loading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            case .success(let image):
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .clipped()
            case .failure:
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
        }
    }
}

