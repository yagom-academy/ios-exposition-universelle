//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by SeoDongyeon on 2022/04/14.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var detailDescription: String?
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUILabel()
    }
    
    func updateUILabel() {
        if let text = detailDescription {
            detailDescriptionLabel.text = text
        }
    }
}
