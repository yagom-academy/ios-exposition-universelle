//
//  ItemViewController.swift
//  Expo1900

import UIKit

final class ItemViewController: UIViewController {
    var item: Item?

    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = item?.name
        self.descriptionTextView.text = item?.itemDescription

        guard let itemImageName = item?.imageName else {
            self.itemImage.image = UIImage(systemName: "exclamationmark.triangle.fill")
            printErrorLog()
            return
        }
        
        self.itemImage.image = UIImage(named: itemImageName)
        descriptionTextView.setDynamicType(with: UIFont.preferredFont(forTextStyle: .body))
    }
}
