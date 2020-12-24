//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class PostExpositionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonAnalyzer = JSONAnalyzer()
        if let data = jsonAnalyzer.readFile(forName: "exposition_universelle_1900", Exposition.self) {
            setPostText(data)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
        UIOrientation.setUIOrientation(.portrait)
    }
    
    private func setPostText(_ data: Exposition) {
        let visitor = data.visitors
        let location = data.location
        let duration = data.duration
        
        titleLabel.text = data.title
        visitorsLabel.text = "방문객 : \(visitor) 명"
        locationLabel.text = "개최지 : \(location)"
        durationLabel.text = "개최 기간 : \(duration)"
        descriptionLabel.text = data.description
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        if let koreaExpositionViewController = storyboard?.instantiateViewController(identifier: "KoreaExposition") {
            navigationController?.navigationBar.isHidden = false
            navigationController?.pushViewController(koreaExpositionViewController, animated: true)
        }
    }
}
