//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by 김민성 on 2023/06/28.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    var entry: Entry?
    @IBOutlet weak private var entryDescriptionLabel: UILabel!
    @IBOutlet weak private var entryImageView: UIImageView!
    static let identifier = "entryDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.entry?.name
        self.configureComponents()
    }
    
    private func configureComponents() {
        if let entry = self.entry {
            self.entryImageView.image = UIImage(named: entry.imageName)
            self.entryDescriptionLabel.text = entry.description
        }
    }
}
