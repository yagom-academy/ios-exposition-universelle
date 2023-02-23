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
    var navigationTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImage.image = UIImage(named: imageString)
        itemDescription.text = fullDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
