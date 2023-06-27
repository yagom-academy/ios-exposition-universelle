//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillLabels()
    }

    func fillLabels() {
        var expoGuideData = ExpoGuide()
        
        do {
            expoGuideData = try ExpoGuide.decode(file: "exposition_universelle_1900")
        } catch {}
        
        titleLabel.text = expoGuideData.title
        visitorsLabel.text = "방문객 : \(String(describing: expoGuideData.visitors)) 명"
        locationLabel.text = "개최지 : \(String(describing: expoGuideData.location))"
        durationLabel.text = "개최 기간: \(String(describing: expoGuideData.duration))"
        descriptionLabel.text = expoGuideData.description
    }
}

