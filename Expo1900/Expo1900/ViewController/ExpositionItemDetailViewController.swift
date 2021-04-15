//
//  ExpositionItemDetailViewController.swift
//  Expo1900
//
//  Created by ysp on 2021/04/16.
//

import UIKit

class ExpositionItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemName: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    var itemNameString: String?
    var itemDescriptionString: String?
    var itemTitleString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try DetailViewUpdateUI()
        } catch {
            print("DetailViewUpdateUIError")
        }
    }
    
    func DetailViewUpdateUI() throws {
        guard let itemTitle = itemTitleString else { throw ExpositionItemDetailError.itemNameString }
            self.navigationItem.title = itemTitle
        guard let itemNameString = itemNameString else { throw ExpositionItemDetailError.itemNameString }
            itemName.image = UIImage(named: itemNameString)
        guard let itemDescriptionString = itemDescriptionString else { throw ExpositionItemDetailError.itemDescriptionString }
            itemDescription.text = itemDescriptionString
    }
}
