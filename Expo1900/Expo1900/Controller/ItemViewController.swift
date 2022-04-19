//
//  ItemViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/15.
//

import UIKit

final class ItemViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayItemInfo()
    }
    
    private func displayItemInfo() {
        guard let item = item else { return }
        
        navigationItem.title = item.name
        itemImageView.image = UIImage(named: "\(item.imageName).png")
        descriptionLabel.text = item.description
    }
}
