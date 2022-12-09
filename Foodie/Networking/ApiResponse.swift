//
//  ApiResponse.swift
//  Foodie
//
//  Created by İlayda Öner on 5.12.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}

