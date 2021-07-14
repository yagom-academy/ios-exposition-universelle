//
//  ExhibitionItemDetailViewController.swift
//  Expo1900
//
//  Created by KimJaeYoun on 2021/07/13.
//

import UIKit

class ExhibitionItemDetailViewController: UIViewController {
  
    private var exhibitionItem: ExhibitionItem?
    
    @IBOutlet private weak var exhibitionItemImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = exhibitionItem?.imageName else {
            return
        }
        self.navigationItem.title = exhibitionItem?.name
        self.exhibitionItemImage.image = UIImage(named: image)
        self.descriptionLabel.text = exhibitionItem?.description
    }
    
    func configure(_ item: ExhibitionItem) {
        self.exhibitionItem = item
    }
}
