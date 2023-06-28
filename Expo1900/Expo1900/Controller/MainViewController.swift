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
    
    private let numberFormatter = NumberFormatter()
    
    private func decimalNumber() {
        numberFormatter.numberStyle = .decimal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decimalNumber()
        fillLabels()
    }

    func fillLabels() {
        var expoGuideData = ExpoGuide()
        
        do {
            expoGuideData = try ExpoGuide.decode(file: "exposition_universelle_1900")
        } catch {}
        
        guard let visitorText = expoGuideData.visitors,
              let locationText = expoGuideData.location,
              let durationText = expoGuideData.duration else { return }
        
        guard let decimalVisitorText = numberFormatter.string(from: visitorText as NSNumber) else { return }
        
        titleLabel.text = expoGuideData.title?.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = "방문객 : \(String(decimalVisitorText)) 명"
        locationLabel.text = "개최지 : \(locationText)"
        durationLabel.text = "개최 기간: \(durationText)"
        descriptionLabel.text = expoGuideData.description
    }
}

