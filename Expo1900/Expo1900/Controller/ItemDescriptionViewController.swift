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
    
    var itemImage: String = ""
    var itemDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        itemImageView.image = UIImage(named: itemImage)
        itemDescriptionLabel.text = itemDescription
    }
}
