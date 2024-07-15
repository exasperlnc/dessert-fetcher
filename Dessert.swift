//
//  Dessert.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/15/24.
//

import Foundation

struct Dessert: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    enum CodingKeys: String, CodingKey {
        case idMeal = "idMeal"
        case strMeal = "strMeal"
        case strMealThumb = "strMealThumb"
    }
}
