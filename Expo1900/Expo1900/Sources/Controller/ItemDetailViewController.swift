//
//  Expo1900 - ItemDetailViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    static let viewIdentifier = "itemDetailViewController"
    private var navigationTitle: String
    private var imageName: String
    private var descriptionText: String

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navigationTitle
        descriptionLabel.text = descriptionText
        imageView.image = UIImage(named: imageName)
    }
    
    init?(item: ExhibitItem, coder: NSCoder) {
        self.navigationTitle = item.name
        self.descriptionText = item.description
        self.imageName = item.imageName
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
