//
//  DetailItemViewController.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/29.
//

import UIKit

final class DetailItemViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    private var detailItems: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels()
    }
    
    func model(_ detailItem: Item) {
        self.detailItems = detailItem
    }
    
    private func labels() {
        guard let item = detailItems else { return }
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
}
