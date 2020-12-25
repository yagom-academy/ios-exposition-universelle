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
    
    var itemName: String?
    var itemDescription: String?
    var itemImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemName = self.itemName,
              let itemDescription = self.itemDescription,
              let itemImage = self.itemImage else {
            return
        }
        self.title = itemName
        self.descriptionLabel.text = itemDescription
        self.itemImageView.image = itemImage
    }
}
