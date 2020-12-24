//
//  ExhibitionWorkViewController.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/23.
//

import UIKit

class ExhibitionWorkViewController: UIViewController {
    
    @IBOutlet weak var workImage: UIImageView!
    @IBOutlet weak var workDescription: UITextView!
    var imageFile: UIImage?
    var descriptionData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workImage.image = imageFile
        workDescription.text = descriptionData
    }
}
