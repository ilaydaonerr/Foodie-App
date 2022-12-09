//
//  DishPortraitCollectionViewCell.swift
//  Foodie
//
//  Created by İlayda Öner on 2.12.2022.
//

import UIKit


class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishPortraitCollectionViewCell.self)

    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
   
    func setUp(dish: Dish) {
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
        
    }
}
