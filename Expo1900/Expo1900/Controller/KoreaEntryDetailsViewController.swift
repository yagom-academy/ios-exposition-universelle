//
//  KoreaEntryDetailsViewController.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/16.
//

import UIKit

final class KoreaEntryDetailsViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDescriptionLabel: UILabel!
    
    var exhibit: Exhibits?
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIItems()
    }
}

// MARK: - UI
extension KoreaEntryDetailsViewController {
    
    private func updateUIItems() {
        guard let exhibit = exhibit else {
            return
        }
        
        entryImageView.image = UIImage(named: exhibit.imageName)
        navigationItem.title = exhibit.name
        entryDescriptionLabel.text = exhibit.description
        entryDescriptionLabel.lineBreakMode = .byWordWrapping
        entryDescriptionLabel.numberOfLines = 0
    }
}
