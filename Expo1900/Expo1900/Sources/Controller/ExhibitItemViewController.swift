//
//  Expo1900 - ExhibitItemViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExhibitItemViewController: UIViewController {
    var prepareTitle: String = ""
    var prepareImage: String = ""
    var prepareDescription: String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = prepareTitle
        descriptionLabel.text = prepareDescription
        imageView.image = UIImage(named: prepareImage)
    }
}
