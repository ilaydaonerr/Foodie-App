//
//  ListDishesViewController.swift
//  Foodie
//
//  Created by İlayda Öner on 2.12.2022.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var category: DishCategory!
    var dishes: [Dish] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }

        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }

}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setUp(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
