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
    }
    
    fileprivate func setPostText(_ data: Exposition) {
        titleLabel.text = data.title
        visitorsLabel.text = "방문객 : \(String(data.visitors)) 명"
        locationLabel.text = "개최지 : \(data.location)"
        durationLabel.text = "개최 기간 : \(data.duration)"
        descriptionLabel.text = data.description
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        guard let koreaExpositionViewController = storyboard?.instantiateViewController(identifier: "KoreaExposition") else {
            return
        }
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(koreaExpositionViewController, animated: true)
    }
}
