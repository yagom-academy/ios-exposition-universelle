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
    
    @IBOutlet weak private var entryImageView: UIImageView!
    @IBOutlet weak private var entryDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryImageView.image = UIImage(named: deliveredImageName)
        NavigationBarFormatter.setTitle( navigationItem, title: deliveredTitle)
        entryDescriptionLabel.text = deliveredDescription
        CustomLabel.setLineBreakMode(into: entryDescriptionLabel, style: .byWordWrapping)
        CustomLabel.setNumberOfLinesToZero(into: entryDescriptionLabel)
    }
}
