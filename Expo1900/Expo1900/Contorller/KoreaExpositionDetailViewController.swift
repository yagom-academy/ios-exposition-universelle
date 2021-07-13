//
//  KoreaExpositionDetailViewController.swift
//  Expo1900
//
//  Created by Kim Do hyung on 2021/07/12.
//

import UIKit

class KoreaExpositionDetailViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailViewTitle: UINavigationItem!
    var koreaExpositionItem: KoreaExposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchingInitialValue()
    }
    
    private func matchingInitialValue() {
        if let unwrappedKoreaExpositionItem = koreaExpositionItem {
            itemImage.image = UIImage(named: unwrappedKoreaExpositionItem.imageName)
            descriptionLabel.text = unwrappedKoreaExpositionItem.description
            detailViewTitle.title = unwrappedKoreaExpositionItem.name
        }
    }
}

