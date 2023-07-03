//
//  DetailItemViewController.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/29.
//

import UIKit

final class DetailItemViewController: UIViewController {
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    
    private var detailItems: Item?
    
    init?(item: Item, coder: NSCoder) {
        super.init(coder: coder)
        detailItems = item
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createItemlabels()
        createItemTitle()
    }
    
    private func createItemlabels() {
        guard let item = detailItems else { return }
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
    
    private func createItemTitle() {
        self.title = detailItems?.name
    }
}
