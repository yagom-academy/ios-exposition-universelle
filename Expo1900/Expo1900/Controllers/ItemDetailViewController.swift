//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/22.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemDescription: UILabel!
    
    let item: ExpositionUniverselleItem

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    init?(item: ExpositionUniverselleItem, coder: NSCoder) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.navigationItem.title = item.name
        itemImage.image = UIImage(named: item.imageName)
        itemDescription.text = item.description
    }
}
