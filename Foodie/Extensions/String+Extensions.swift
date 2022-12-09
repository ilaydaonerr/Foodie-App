//
//  String+Extensions.swift
//  Foodie
//
//  Created by İlayda Öner on 1.12.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
