//
//  ExpositionDetailViewController.swift
//  Expo1900
//
//  Created by Do Yi Lee on 2021/07/09.
//

import UIKit

class ExpositionDetailViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    var expositionItem: ExpositionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImage.image = expositionItem?.image
        itemDescriptionLabel.text = expositionItem?.description
        self.navigationItem.title = expositionItem?.name
    }
    
    func configure(expositionItem: ExpositionItem) {
        self.expositionItem = expositionItem
    }
    
}
