//
//  DishListTableViewCell.swift
//  Foodie
//
//  Created by İlayda Öner on 2.12.2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = String(describing: DishListTableViewCell.self)

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageview: UIImageView!

    func setUp(dish: Dish) {
        descriptionLabel.text = dish.description
        dishImageview.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name

    }

    func setUp(orders: Orders) {
        descriptionLabel.text = orders.name
        dishImageview.kf.setImage(with: orders.dish?.image?.asUrl)
        titleLabel.text = orders.dish?.name
    }
}
