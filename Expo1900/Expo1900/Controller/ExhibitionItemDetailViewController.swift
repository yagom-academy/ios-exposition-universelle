//
//  ExhibitionItemDetailViewController.swift
//  Expo1900
//
//  Created by KimJaeYoun on 2021/07/13.
//

import UIKit

protocol ExhibitionItemGettable {
    func getExhibitionItem(_ item: ExhibitionItem)
}

class ExhibitionItemDetailViewController: UIViewController, ExhibitionItemGettable {
  
    var exhibitionItem: ExhibitionItem?
    @IBOutlet weak var exhibitionItemImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = exhibitionItem?.imageName else {
            return
        }
        self.exhibitionItemImage.image = UIImage(named: image)
        self.descriptionLabel.text = exhibitionItem?.description
        
    }
    
    func getExhibitionItem(_ item: ExhibitionItem) {
        self.exhibitionItem = item
    }
}

