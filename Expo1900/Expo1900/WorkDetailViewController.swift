//
//  WorkDetailViewController.swift
//  Expo1900
//
//  Created by 강인희 on 2020/12/23.
//

import UIKit

class WorkDetailViewController: UIViewController {
    @IBOutlet weak var workImage: UIImageView!
    @IBOutlet weak var workDescription: UITextView!
    
    var workTitle = String()
    var workImageData = UIImage()
    var workDescriptionContents = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workDescription.isEditable = false
        
        workImage.image = workImageData
        workDescription.text = workDescriptionContents
    }
}
