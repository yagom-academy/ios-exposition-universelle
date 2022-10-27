//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/21.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescLabel: UILabel!
    
    var selectedItem: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    private func configureView() {
        self.navigationItem.title = selectedItem?.name
        itemImageView.image = UIImage(named: selectedItem?.imageName ?? "flag")
        itemImageView.contentMode = .scaleAspectFit
        itemDescLabel.text = selectedItem?.desc
        itemDescLabel.numberOfLines = 0
    }
}
