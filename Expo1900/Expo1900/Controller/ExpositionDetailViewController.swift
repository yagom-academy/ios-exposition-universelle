//
//  ExpositionDetailViewController.swift
//  Expo1900
//
//  Created by Do Yi Lee on 2021/07/09.
//

import UIKit

class ExpositionDetailViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    
    var expositionItem: ExpositionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImageView.image = expositionItem?.image
        itemDescriptionLabel.text = expositionItem?.description
        self.navigationItem.title = expositionItem?.name
    }
    
    func configure(expositionItem: ExpositionItem) {
        self.expositionItem = expositionItem
    }
}
