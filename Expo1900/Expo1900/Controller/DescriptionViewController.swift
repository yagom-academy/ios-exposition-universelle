//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/16.
//

import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var detailedDescription: UILabel!
    var textToSet: String?
    var imageToSet: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.imageview.image = self.imageToSet?.image
        self.detailedDescription.text = self.textToSet
    }
}
