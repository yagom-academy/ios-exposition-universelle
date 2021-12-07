//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }

    func updateLabels() {
        do {
            let expostion = try Exposition()
            titleLabel.text = expostion.title
            visitorsLabel.text = String(expostion.visitors)
            locationLabel.text = expostion.location
            durationLabel.text = expostion.duration
            descriptionLabel.text = expostion.description
        } catch Expo1900Error.dataNotFoundInAsset(let fileName) {
            print(Expo1900Error.dataNotFoundInAsset(fileName).description)
        } catch {
            print(error)
        }
    }
}

