//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expositionUniverselle: ExpositionUniverselle? = nil

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionUniverselle = try jsonDecoder.decode(ExpositionUniverselle.self, from: dataAsset.data)
        } catch {
            print("error")
        }
        let title = expositionUniverselle?.title
        let changeTitle = title?.replacingOccurrences(of: "(", with: "\n(")
        
        titleLabel.text = changeTitle
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25.0)
        
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        
        guard let result = numberformatter.string(for: expositionUniverselle?.visitors) else {
            return
        }
        
        guard let location = expositionUniverselle?.location,
        let duration = expositionUniverselle?.duration else {
            return
        }
        
        visitorsLabel.text = "방문객 : \(result) 명"
        locationLabel.text = "개최지 : \(location)"
        durationLabel.text = "개최기간 : \(duration)"
        descriptionLabel.text = expositionUniverselle?.description
        
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
    }


}

