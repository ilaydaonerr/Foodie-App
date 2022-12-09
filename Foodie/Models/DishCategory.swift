//
//  DishCategory.swift
//  Foodie
//
//  Created by İlayda Öner on 1.12.2022.
//

import Foundation

struct DishCategory: Decodable {
    let id, name, image: String?
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
