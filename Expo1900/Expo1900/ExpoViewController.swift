//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    var expoUniverselle: ExpoUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expoUniverselle = try jsonDecoder.decode(ExpoUniverselle.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        if let expoData = expoUniverselle {
            self.titleLabel.text = expoData.title
            self.visitorLabel.text = "방문객 : \(expoData.visitors) 명"
            self.locationLabel.text = "개최지 : \(expoData.location)"
            self.durationLabel.text = "개최 기간: \(expoData.duration)"
            self.descriptionLabel.text = expoData.description
        }
        
    }


}

