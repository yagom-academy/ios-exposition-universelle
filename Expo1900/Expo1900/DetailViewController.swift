//
//  DetailViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    var imageString: String?
    var fullDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageString = imageString, let fullDescription = fullDescription else { return }
        itemImage.image = UIImage(named: imageString)
        itemDescription.text = fullDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
