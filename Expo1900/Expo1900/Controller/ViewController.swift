//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var viewKoreaEnrtyListButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExpositionInformation()
    }
    
    func loadExpositionInformation() {
        guard let expositionData = parseExpositionJSON() else {
            return
        }
        
        titleLabel.text = expositionData.title
        visitorsCountLabel.text = "방문객 : \(expositionData.visitorsCount)"
        locationLabel.text = "개최지 : \(expositionData.location)"
        durationLabel.text = "개최기간 : \(expositionData.duration)"
        descriptionTextView.text = expositionData.description
    }
}

