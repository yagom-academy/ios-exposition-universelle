//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/22.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemDescription: UILabel!
    
    var itemData: ExpositionUniverselleItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        guard let itemData = itemData else { return }
        self.title = itemData.name
        itemImage.image = UIImage(named: itemData.imageName)
        itemDescription.text = itemData.description
    }
}
