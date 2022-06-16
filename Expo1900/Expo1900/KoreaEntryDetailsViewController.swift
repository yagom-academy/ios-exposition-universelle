//
//  KoreaEntryDetailsViewController.swift
//  Expo1900
//
//  Created by 전민수 on 2022/06/16.
//

import UIKit

class KoreaEntryDetailsViewController: UIViewController {

    var someImage: String = ""
    var someDescription: String = ""
    var entryTitle: String = ""
    
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryImageView.image = UIImage(named: someImage)
        entryDescriptionLabel.text = someDescription
        entryDescriptionLabel.lineBreakMode = .byWordWrapping
        entryDescriptionLabel.numberOfLines = 0
        navigationItem.title = entryTitle
    }
}
