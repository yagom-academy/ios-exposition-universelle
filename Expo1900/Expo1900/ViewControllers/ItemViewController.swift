//
//  ItemViewController.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/13.
//

import UIKit

class ItemViewController: UIViewController {
    var items: Exhibit?
    
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let entryItems = items else { return }
        self.itemImage.image = UIImage(named: entryItems.imageName)
        self.itemDescription.text = entryItems.description
        self.title = entryItems.name

    }

}
