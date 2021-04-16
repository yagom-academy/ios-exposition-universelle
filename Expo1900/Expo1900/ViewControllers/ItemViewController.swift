//
//  ItemViewController.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/13.
//

import UIKit

class ItemViewController: UIViewController {
    var itemTitleToSet: String?
    var descriptionToSet: String?
    var imageToSet: String?
    
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.itemDescription.text = self.descriptionToSet
        self.itemImage.image = UIImage(named: imageToSet!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = itemTitleToSet

    }

}
