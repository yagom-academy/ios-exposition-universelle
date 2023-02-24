//
//  ExhibitItemViewController.swift
//  Expo1900
//
//  Created by Rhode, Christy Lee on 2023/02/23.
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
        self.navigationItem.title = prepareTitle
        descriptionLabel.text = prepareDescription
        imageView.image = UIImage(named: prepareImage)
    }
}
