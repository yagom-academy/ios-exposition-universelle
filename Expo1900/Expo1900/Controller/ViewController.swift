//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var visitorNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftFlagLabel: UIImageView!
    @IBOutlet weak var rightFlagLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func configureUI(expoInformation: ExpoInformation) {
        mainTitleLabel.text = expoInformation.title
        mainImageView.image = UIImage(named: "poster")
        visitorNumberLabel.text = String(expoInformation.visitors)
        locationLabel.text = expoInformation.location
        durationLabel.text = expoInformation.duration
        descriptionLabel.text = expoInformation.description
        leftFlagLabel.image = UIImage(named: "flag")
        rightFlagLabel.image = UIImage(named: "flag")
    }
}

