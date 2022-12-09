//
//  DishViewController.swift
//  Foodie
//
//  Created by İlayda Öner on 2.12.2022.
//

import UIKit
import ProgressHUD


class DishViewController: UIViewController {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       populateView()
    }
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }

    @IBAction func placeOrderButton(_ sender: Any) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    

}
