//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var leftFlagImage: UIImageView!
    @IBOutlet private weak var rightFlagImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let exposition = try? JSONParser.parse(name: "exposition_universelle_1900", type: Exposition.self).get() else {
            return
        }
        
        let numberFommater = NumberFormatter()
        numberFommater.numberStyle = .decimal
        guard let visitors = numberFommater.string(for: exposition.visitors) else {
            return
        }
        
        titleLabel.text = exposition.title
        mainImage.image = exposition.image
        visitorsLabel.text = "\(visitors) 명"
        locationLabel.text = exposition.location
        durationLabel.text = exposition.duration
        // descriptionLabel.text = exposition.description
        // leftFlagImage.image = UIImage(named: "flag")
        // rightFlagImage.image = UIImage(named: "flag")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

