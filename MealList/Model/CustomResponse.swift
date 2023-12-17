//
//  CustomResponse.swift
//  MealList
//
//  Created by Jyothi Suhani Peddi on 12/17/23.
//

import Foundation
class CustomResponse {
    init(responseCode: Int, desc: String) {
        code = responseCode
        description = desc
    }
    var code: Int?
    var description: String?
}
