//
//  ExpositionItemDetailViewController.swift
//  Expo1900
//
//  Created by hy on 2022/10/20.
//

import UIKit

class ExpositionItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionTextView: UITextView!
    
    var item: ExpositionUniverselleItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignContentValue()
    }
    
    private func assignContentValue() {
        guard let item = item else {
            return
        }
        
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionTextView.text = item.description
        itemDescriptionTextView.isScrollEnabled = false
    }
}
