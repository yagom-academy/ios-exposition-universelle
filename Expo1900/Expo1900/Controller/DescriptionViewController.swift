//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/16.
//

import UIKit

final class DescriptionViewController: UIViewController {
    @IBOutlet private(set) weak var imageview: UIImageView!
    @IBOutlet private(set) weak var detailedDescription: UILabel!
    var textToSet: String?
    var imageToSet: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageview.image = self.imageToSet?.image
        self.detailedDescription.text = self.textToSet
    }
}
