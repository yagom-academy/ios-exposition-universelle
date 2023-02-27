//
//  Expo1900 - ExhibitItemViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExhibitItemViewController: UIViewController {
    var prepareTitle: String = NameSpace.emptyString
    var prepareImage: String = NameSpace.emptyString
    var prepareDescription: String = NameSpace.emptyString
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = prepareTitle
        descriptionLabel.text = prepareDescription
        imageView.image = UIImage(named: prepareImage)
    }
}
