//
//  DetailViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var itemImageVIew: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var exhibitionItem: ExhibitionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        guard let exhibitionItem = exhibitionItem else {
            return
        }
        
        itemImageVIew.image = UIImage(named: exhibitionItem.imageName)
        descriptionLabel.text = exhibitionItem.description
        self.title = exhibitionItem.name
    }
}
