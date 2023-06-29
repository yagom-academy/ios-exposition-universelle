//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/28.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    static let id = "itemDetailViewControllerID"
    
    private let item: Item
    
    @IBOutlet weak var itemDetailImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    init?(item: Item, coder: NSCoder) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        navigationItem.title = item.name
        itemDetailImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
}
