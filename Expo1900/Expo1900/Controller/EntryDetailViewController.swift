//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Minsup, Jusbug on 2023/06/28.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    private var entry: Entry
    @IBOutlet weak private var entryDescriptionLabel: UILabel!
    @IBOutlet weak private var entryImageView: UIImageView!
    static let identifier = "entryDetailViewController"
    
    init?(entry: Entry, coder: NSCoder) {
        self.entry = entry
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.configureComponents()
    }
    
    private func configureNavigation() {
        self.navigationItem.title = self.entry.name
    }
    
    private func configureComponents() {
        self.entryImageView.image = UIImage(named: entry.imageName)
        self.entryDescriptionLabel.text = entry.longDescription
    }
}
