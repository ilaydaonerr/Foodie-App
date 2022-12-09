//
//  OnboardingCollectionViewCell.swift
//  Foodie
//
//  Created by İlayda Öner on 1.12.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideDescription: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    
    func setUp (_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescription.text = slide.title
        
    }
}
