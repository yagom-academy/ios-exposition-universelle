//
//  Expo1900 - ViewController.swift
//  Created by 사파리 파프리. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expoInfomation = Expo.parsingJson(name: "exposition_universelle_1900") else { return }
        
        titleLabel.text = expoInfomation.title
        posterImageView.image = UIImage(named: "poster")
        visitorsLabel.text = "방문객 : \(expoInfomation.visitors)"
        locationLabel.text = "개최지 : \(expoInfomation.location)"
        durationLabel.text = "개최기간 : \(expoInfomation.duration)"
        decriptionLabel.text = expoInfomation.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

}

