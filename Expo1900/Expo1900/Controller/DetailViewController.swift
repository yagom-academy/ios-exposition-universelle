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
        configureView()
    }
    
    private func configureView() {
        guard let item = item else { return }
        updateData(with: item)
    }
    
    private func updateData(with item: Item) {
        itemImageView.image = UIImage(named: "\(item.imageUrl)")
        detailDescriptionLabel.text = "\(item.description)"
    }
}
