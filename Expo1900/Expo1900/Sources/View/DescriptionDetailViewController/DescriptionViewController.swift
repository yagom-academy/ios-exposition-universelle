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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DescriptionOfDescription.text = descriptionText
        DescriptionImageView.image = UIImage(named: imageName!)
    }
    
}
