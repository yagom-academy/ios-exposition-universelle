//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class WorldsExpoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var introductionImageView: UIImageView!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nationFlagImageView1: UIImageView!
    @IBOutlet weak var nationFlagImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setComponent()
    }
    
    func setComponent() {
        let parsedResult = ParsingManager.shared.parse(name: "exposition_universelle_1900", to: ExpoIntroduction.self)
        switch parsedResult {
        case .success(let parsedData):
            titleLabel.text = parsedData.title
            visitorCountLabel.text = String(parsedData.visitors)
            locationLabel.text = parsedData.location
            durationLabel.text = parsedData.duration
            descriptionTextView.text = parsedData.description
        case .failure(let parsedError):
            showAlert(error: parsedError)
        }
    }
}

