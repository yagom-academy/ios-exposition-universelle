//
//  ItemViewController.swift
//  Expo1900
//
//  Created by 홍정아 on 2021/07/09.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    private var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemInit()
    }
    
    private func itemInit() {
        guard let item = item else {
            return
        }
        self.navigationItem.title = item.name
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
    
    func setItem(item: Item) {
        self.item = item
    }
}
