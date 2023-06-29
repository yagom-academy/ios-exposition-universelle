//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/28.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var entryName: String = String()
    private var entryImageName: String = String()
    private var descriptionText: String = String()
    
    init?(entry: Entry, coder: NSCoder) {
        super.init(coder: coder)
        
        entryName = entry.name
        entryImageName = entry.imageName
        descriptionText = entry.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        entryImageView.image = UIImage(named: entryImageName)
        descriptionLabel.text = descriptionText
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = entryName
    }
}
