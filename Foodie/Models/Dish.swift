//
//  Dish.swift
//  Foodie
//
//  Created by İlayda Öner on 2.12.2022.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
