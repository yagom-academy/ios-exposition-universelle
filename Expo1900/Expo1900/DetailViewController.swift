//
//  DetailViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    var imageString: String = ""
    var fullDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImage.image = UIImage(named: imageString)
        itemDescription.text = fullDescription
    }
}
