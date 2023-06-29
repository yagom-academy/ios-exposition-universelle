//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/28.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var entryName: String = String()
    var entryImageName: String = String()
    var descriptionText: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        entryImageView.image = UIImage(named: entryImageName)
        descriptionLabel.text = descriptionText
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = entryName
    }
}
