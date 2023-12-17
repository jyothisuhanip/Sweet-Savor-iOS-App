//
//  ErrorView.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/17/23.
//

import SwiftUI

struct ErrorView: View {
    let response: CustomResponse
    var body: some View {
        if let desc = response.description {
            Text(desc)
        }
    }
}


