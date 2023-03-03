//
//  Expo1900 - ItemDetailViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ItemDetailViewController: UIViewController {

    private var navigationTitle: String
    private var imageName: String
    private var descriptionText: String

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    init?(item: ExhibitItem, coder: NSCoder) {
        self.navigationTitle = item.name
        self.descriptionText = item.description
        self.imageName = item.imageName
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureContent()
    }
    
    private func configureTitle() {
        navigationItem.title = navigationTitle
    }
    
    private func configureContent() {
        descriptionLabel.text = descriptionText
        imageView.image = UIImage(named: imageName)
    }
}
