//
//  ItemViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/15.
//

import UIKit

final class ItemViewController: UIViewController {
    @IBOutlet weak private var itemImageView: UIImageView!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    private var item: Item?
    
    init?(_ coder: NSCoder, _ item: Item) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayItemInfo()
    }
    // MARK: - functions
    private func displayItemInfo() {
        guard let item = item else { return }
        navigationItem.title = item.name
        itemImageView.image = UIImage(named: "\(item.imageName).png")
        descriptionLabel.text = item.description
    }
}
