//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by hyunMac on 11/3/23.
//

import UIKit

class DescriptionDetailViewController: UIViewController {

    @IBOutlet weak var DescriptionImageView: UIImageView!
    @IBOutlet weak var DescriptionOfDescription: UITextView!

    var titleName: String?
    var imageSourceName: String?
    var descriptionText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        try configureUI()
    }
    
    func configureUI() throws {
        self.navigationItem.title = titleName
        DescriptionOfDescription.text = descriptionText
        guard let imageName = imageSourceName else {
            throw generateError.FailedToGetImageName
        }
        DescriptionImageView.image = UIImage(named: imageName)
    }
}
