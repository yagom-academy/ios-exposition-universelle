//
//  ExhibitionItemDetailViewController.swift
//  Expo1900
//
//  Created by KimJaeYoun on 2021/07/13.
//

import UIKit

class ExpositionItemDetailViewController: UIViewController {
    private var expositionItem: ExpositionItem?
    static let identifier: String = "DetailViewController"
    
    @IBOutlet private weak var expositionItemImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = expositionItem?.name
        self.descriptionLabel.text = expositionItem?.description
        
        if let expositionItemImage = expositionItem?.imageName {
            self.expositionItemImage.image = UIImage(named: expositionItemImage)
        } else {
            let image = UIImage(systemName: "questionmark.folder")
            self.expositionItemImage.image = image?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        }
    }
    
    func configure(_ item: ExpositionItem) {
        self.expositionItem = item
    }
}

