//  ExhibitDetailViewController.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/21.

import UIKit

class ExhibitDetailViewController: UIViewController {
    @IBOutlet weak var exhibitImageView: UIImageView!
    @IBOutlet weak var exhibitDescriptionTextView: UITextView!
    var exhibitData: ExhibitData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let exhibit = exhibitData else {
            return
        }
        
        exhibitImageView.image = exhibit.image
        exhibitDescriptionTextView.text = exhibit.description
        navigationItem.title = exhibit.name
    }
}
