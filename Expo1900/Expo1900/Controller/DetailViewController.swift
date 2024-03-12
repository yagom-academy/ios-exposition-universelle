//
//  DetailViewController.swift
//  Expo1900
//
//  Created by H on 3/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: Item?

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = item {
            itemImageView.image = UIImage(named: "\(item.imageUrl)")
            detailDescriptionLabel.text = "\(item.description)"
        }
    }
}
