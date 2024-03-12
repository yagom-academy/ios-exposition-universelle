//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var expositionData: Exposition?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moveToListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeExpositionData()
        updateData()
    }
    
    private func decodeExpositionData() {
        let jsonDecoder = JSONDecoder()
        guard let jsonData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionData = try jsonDecoder.decode(Exposition.self, from: jsonData.data)
        } catch {
            print(error.localizedDescription)
        }
        
        guard let expositionData = expositionData else {
            return
        }
    }
    
    private func updateData() {
        guard let expositionData = expositionData else {
            return
        }
        
        titleLabel.text = expositionData.title
        imageView.image = UIImage(named: "poster")
        visitorsLabel.text = "방문객: \(expositionData.visitors) 명"
        locationLabel.text = "개최지: \(expositionData.location)"
        durationLabel.text = "개최 기간: \(expositionData.duration)"
        descriptionLabel.text = "\(expositionData.description)"
    }
}
