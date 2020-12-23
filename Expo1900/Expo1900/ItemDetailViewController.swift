//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by 임성민 on 2020/12/23.
//

import UIKit

class ItemDetailViewController: UIViewController {    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = self.item else { return }
        let itemImage = UIImage(named: item.imageName)
        
        self.itemImageView.image = itemImage
        self.descriptionLabel.text = item.description
        self.title = item.name
    }
}
