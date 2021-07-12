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
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder = JSONDecoder()
        
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        titleLabel.text = exposition?.title
        visitorsLabel.text = exposition?.visitors?.description
        locationLabel.text = exposition?.location
        durationLabel.text = exposition?.duration
        descriptionLabel.text = exposition?.description
    }
}

