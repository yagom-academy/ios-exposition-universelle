//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/28.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    static let id = "itemDetailViewControllerID"
    var item: Item?

    @IBOutlet weak var itemDetailImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        guard let item else {
            return
        }
        
        navigationItem.title = item.name
        itemDetailImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
}
