//
//  ItemInfoViewController.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

final class ItemInfoViewController: UIViewController {

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    
    var paramTitle: String?
    var paramImage: String?
    var paramDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        setLabelAttributes()
    }
    
    private func initializeViews() {
        self.navigationItem.title = paramTitle
        guard let imageName = paramImage else { return }
        self.itemImageView.image = UIImage(named: imageName)
        self.itemDescriptionLabel.text = paramDescription
    }
    
    private func setLabelAttributes() {
        itemDescriptionLabel.numberOfLines = Int.zero
    }
}
