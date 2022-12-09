//
//  DishLandScapeCollectionViewCell.swift
//  Foodie
//
//  Created by İlayda Öner on 2.12.2022.
//

import UIKit


class DishLandScapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishLandScapeCollectionViewCell.self)

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    

    func setUp(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description

    }
}
