//
//  ItemViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/15.
//

import UIKit

class ItemViewController: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayItemInfo()
    }
    
    func displayItemInfo() {
        guard let item = item else { return }
        
        self.navigationItem.title = item.name
        itemImageView.image = UIImage(named: "\(item.imageName).png")
        descriptionLabel.text = item.description
    }
}
