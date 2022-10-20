//
//  ItemViewController.swift
//  Expo1900

import UIKit

class ItemViewController: UIViewController {
    var item: Item?

    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let item = item else { return }
        
        self.itemImage.image = UIImage(named: item.imageName)
        self.descriptionTextView.text = item.itemDescription
    }
}
