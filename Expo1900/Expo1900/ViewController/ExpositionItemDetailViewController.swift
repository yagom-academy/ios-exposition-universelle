//
//  ExpositionItemDetailViewController.swift
//  Expo1900
//
//  Created by ysp on 2021/04/16.
//

import UIKit

class ExpositionItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemImageName: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    var itemImageNameString: String?
    var itemDescriptionString: String?
    var itemNameString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try DetailViewUpdateUI()
        } catch {
            print("DetailViewUpdateUIError")
        }
    }
    
    func DetailViewUpdateUI() throws {
        guard let itemName = itemNameString else { throw ExpositionItemDetailError.itemNameString }
            self.navigationItem.title = itemName
        guard let itemImageNameString = itemImageNameString else { throw ExpositionItemDetailError.itemImageNameString }
            itemImageName.image = UIImage(named: itemImageNameString)
        guard let itemDescriptionString = itemDescriptionString else { throw ExpositionItemDetailError.itemDescriptionString }
            itemDescription.text = itemDescriptionString
    }
}
