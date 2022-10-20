//  Expo1900 - ExpositionViewController.swift
//  Created by inho, LJ
//  Copyright © yagom academy. All rights reserved.

import UIKit

class ExpositionViewController: UIViewController {
    
    @IBOutlet weak var expositionTitleLabel: UILabel!
    @IBOutlet weak var expositionImageView: UIImageView!
    @IBOutlet weak var expositionVisitorsLabel: UILabel!
    @IBOutlet weak var expositionLocationLabel: UILabel!
    @IBOutlet weak var expositionDurationLabel: UILabel!
    @IBOutlet weak var expositionDescriptionTextView: UITextView!
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var showExhibitButton: UIButton!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exposition = JSONDecoder.parse(assetName: "exposition_universelle_1900", to: Exposition.self)
    }
}

