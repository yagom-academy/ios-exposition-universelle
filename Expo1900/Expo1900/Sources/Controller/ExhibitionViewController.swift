//
//  ExhibitionViewController.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

final class ExhibitionViewController: UIViewController {
    var exhibition: Exhibition?
    
    @IBOutlet private weak var exhibitionImageView: UIImageView!
    @IBOutlet private weak var exhibitionDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        guard let exhibition = exhibition else {
            return
        }
        
        navigationItem.title = exhibition.name
        exhibitionImageView.image = UIImage(named: exhibition.imageName)
        exhibitionDescriptionLabel.text = exhibition.description
    }
}
