//
//  UıViewController+Extensions.swift
//  Foodie
//
//  Created by İlayda Öner on 2.12.2022.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return
        storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
