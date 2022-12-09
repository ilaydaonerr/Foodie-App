//
//  CategoryCollectionViewCell.swift
//  Foodie
//
//  Created by İlayda Öner on 1.12.2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
 
    func setUp(category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        
    }
}
