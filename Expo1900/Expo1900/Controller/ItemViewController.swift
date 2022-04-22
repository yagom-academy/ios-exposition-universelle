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
    private let item: Item
    
    init(item: Item) {
        self.item = item
        super .init(nibName: nil, bundle: nil)
    }
    
    init?(_ coder: NSCoder, _ item: Item) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayItemInfo()
    }
    
    private func displayItemInfo() {
        navigationItem.title = item.name
        itemImageView.image = UIImage(named: "\(item.imageName).png")
        descriptionLabel.text = item.description
    }
}
