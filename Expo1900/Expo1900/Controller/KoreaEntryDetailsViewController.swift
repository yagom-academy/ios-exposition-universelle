//
//  KoreaEntryDetailsViewController.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/16.
//

import UIKit

class KoreaEntryDetailsViewController: UIViewController {
    var deliveredImageName: String = ""
    var deliveredDescription: String = ""
    var deliveredTitle: String = ""
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.entryImageView.image = UIImage(named: deliveredImageName)
        NavigationBarFormatter.setTitle( navigationItem, title: deliveredTitle)
        self.entryDescriptionLabel.text = deliveredDescription
        CustomLabel.setLineBreakMode(into: entryDescriptionLabel, style: .byWordWrapping)
        CustomLabel.setNumberOfLinesToZero(into: entryDescriptionLabel)
    }
}
