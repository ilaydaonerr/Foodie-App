//
//  UIView+Extensions.swift
//  Foodie
//
//  Created by İlayda Öner on 1.12.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius
        }
        set { self.layer.cornerRadius = newValue
        }
    }
    }
