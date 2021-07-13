//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Marco, Soll, Yescoach on 2021/07/13.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: @IBOutlets
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Properties
    var entryTitle: String?
    var entryImageName: String?
    var entryDescription: String?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryImageView.image = UIImage(named: entryImageName ?? "")
        descriptionLabel.text = entryDescription
        self.title = entryTitle
    }
}
