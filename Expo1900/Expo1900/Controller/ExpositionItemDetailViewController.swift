//
//  ExhibitionItemDetailViewController.swift
//  Expo1900
//
//  Created by KimJaeYoun on 2021/07/13.
//

import UIKit

class ExpositionItemDetailViewController: UIViewController {
  
    private var expositionItem: ExpositionItem?
    
    @IBOutlet private weak var expositionItemImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expositionItemImage = expositionItem?.imageName else {
            return
        }
        self.navigationItem.title = expositionItem?.name
        self.expositionItemImage.image = UIImage(named: expositionItemImage)
        self.descriptionLabel.text = expositionItem?.description
    }
    
    func configure(_ item: ExpositionItem) {
        self.expositionItem = item
    }
}
