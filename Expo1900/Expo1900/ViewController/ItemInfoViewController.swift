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
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate

    var paramItem: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        setLabelAttributes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appDelegate?.shouldSelectPortrait = false
    }
    
    private func initializeViews() {
        self.navigationItem.title = paramItem?.name
        guard let imageName = paramItem?.imageName else {
            return
        }
        self.itemImageView.image = UIImage(named: imageName)
        self.itemDescriptionLabel.text = paramItem?.description
    }
    
    private func setLabelAttributes() {
        itemDescriptionLabel.numberOfLines = Int.zero
    }
}
