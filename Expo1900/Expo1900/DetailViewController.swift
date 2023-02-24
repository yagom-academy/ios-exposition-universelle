//
//  DetailViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    var imageString: String?
    var fullDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageString = imageString, let fullDescription = fullDescription else { return }
        itemImageView.image = UIImage(named: imageString)
        itemDescriptionLabel.text = fullDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
