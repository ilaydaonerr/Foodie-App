//
//  AllDishes.swift
//  Foodie
//
//  Created by İlayda Öner on 6.12.2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
    
}
