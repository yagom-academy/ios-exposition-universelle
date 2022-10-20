//
//  ExhibitionViewController.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

class ExhibitionViewController: UIViewController {
    var exhibition: Exhibition?
    
    @IBOutlet weak var exhibitionImageView: UIImageView!
    @IBOutlet weak var exhibitionDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let exhibition = exhibition else {
            return
        }
        
        self.navigationItem.title = exhibition.name
        self.exhibitionImageView.image = UIImage(named: exhibition.imageName)
        self.exhibitionDescriptionLabel.text = exhibition.description
    }
}
