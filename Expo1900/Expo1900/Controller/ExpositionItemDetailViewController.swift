//  Expo1900 - ExpositionItemDetailViewController.swift
//  Created by Ayaan, Bella on 2022/10/20.
//  Copyright © yagom academy. All rights reserved.

import UIKit

class ExpositionItemDetailViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionTextView: UITextView!
    
    //MARK: - Property
    var item: ExpositionUniverselleItem?
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignContentValue()
        self.title = item?.name
        itemDescriptionTextView.isScrollEnabled = false
        itemDescriptionTextView.isEditable = false
        itemDescriptionTextView.isSelectable = false
    }
}

extension ExpositionItemDetailViewController {
    //MARK: - Private Method
    private func assignContentValue() {
        guard let item = item else {
            return
        }
        
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionTextView.text = item.description
        itemDescriptionTextView.isScrollEnabled = false
    }
}
