//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var rightFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let exposition = try? JSONParser.parse(name: JSONAsset.mainDataName, type: Exposition.self).get() else {
            return
        }
        updateUI(exposition: exposition)
    }
    
    func updateUI(exposition: Exposition) {
        let numberFommater = NumberFormatter()
        numberFommater.numberStyle = .decimal
        guard let visitors = numberFommater.string(for: exposition.visitors) else {
            return
        }
        titleLabel.text = exposition.title
        mainImageView.image = exposition.image
        visitorsLabel.text = "\(visitors) 명"
        locationLabel.text = exposition.location
        durationLabel.text = exposition.duration
        // descriptionLabel.text = exposition.description
        // leftFlagImageView.image = UIImage(named: "flag")
        // rightFlagImageView.image = UIImage(named: "flag")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

