//
//  ItemDescriptionViewController.swift
//  Expo1900
//
//  Created by kiseok, Toy on 11/1/23.
//

import UIKit

final class ItemDescriptionViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    private var itemImage: String = ""
    private var itemDescription: String = ""
    private var navigationTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func setUp(asset: ExhibitionItem) {
        navigationTitle = asset.name
        itemImage = asset.imageName
        itemDescription = asset.description
    }
    
    private func configureUI() {
        self.navigationItem.title = navigationTitle
        itemImageView.image = UIImage(named: itemImage)
        itemDescriptionLabel.text = itemDescription
    }
}
