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
    
    var descriptionText: String?
    var imageName: String?
    var titleTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = titleTitle
        
        DescriptionOfDescription.text = descriptionText
        DescriptionImageView.image = UIImage(named: imageName!)
    }
    
}
