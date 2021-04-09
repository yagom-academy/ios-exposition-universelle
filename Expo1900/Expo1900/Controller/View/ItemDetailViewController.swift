//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/09.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = itemData.name
        itemImageView.image = UIImage(named: itemData.imageName)
        itemDescLabel.text = itemData.desc
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
