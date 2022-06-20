//
//  KoreaEntryDetailsViewController.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/16.
//

import UIKit

final class KoreaEntryDetailsViewController: UIViewController {
    var exhibit: Exhibits?
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIItems()
    }
    
    private func updateUIItems() {
        guard let exhibit = exhibit else {
            return
        }
        
        self.entryImageView.image = UIImage(named: exhibit.imageName)
        NavigationBarFormatter.setTitle( navigationItem, title: exhibit.name)
        self.entryDescriptionLabel.text = exhibit.description
        self.entryDescriptionLabel.setLineBreakMode(style: .byWordWrapping)
        self.entryDescriptionLabel.setNumberOfLines(0)
    }
}
