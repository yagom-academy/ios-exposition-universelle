//
//  SelectedEntryViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

class SelectedEntryViewController: UIViewController {
    
    var data: ExpositionEntry?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Test"
    }
    
    @IBOutlet weak var selectedEntryImageView: UIImageView!
    @IBOutlet weak var selectedEntryDescriptionLabel: UILabel!
    
    
}

