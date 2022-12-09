//
//  UserDefaults+Extensions.swift
//  Foodie
//
//  Created by İlayda Öner on 7.12.2022.
//

import Foundation

extension UserDefaults {
   private enum UserDefaultsKeys: String {
       case hasOnboarded
    }
   
  var hasOnboarded: Bool {
      get {
           bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
       }
       
        set {
           setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
      }
    }
}
