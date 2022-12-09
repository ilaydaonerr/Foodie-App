//
//  HomeViewController.swift
//  Foodie
//
//  Created by İlayda Öner on 1.12.2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        specialsCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        }

    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandScapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandScapeCollectionViewCell.identifier)
    }
    

}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for:indexPath ) as! CategoryCollectionViewCell
            cell.setUp(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for:indexPath ) as! DishPortraitCollectionViewCell
            cell.setUp(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapeCollectionViewCell.identifier, for:indexPath ) as! DishLandScapeCollectionViewCell
            cell.setUp(dish: specials[indexPath.row] )
            return cell
            
        default: return UICollectionViewCell()
            
            
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
