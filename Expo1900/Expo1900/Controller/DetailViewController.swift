//
//  DetailViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak private var itemImageVIew: UIImageView!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    var exhibitionItem: ExhibitionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView() {
        guard let exhibitionItem = exhibitionItem else {
            return
        }
        
        self.itemImageVIew.image = UIImage(named: exhibitionItem.imageName)
        self.descriptionLabel.text = exhibitionItem.description
        self.title = exhibitionItem.name
    }
}
