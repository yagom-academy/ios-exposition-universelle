//
//  Expo1900 - ViewController.swift
//  Created by Christy, Rhode. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = "메인"

        let decoder = JSONDecoder()
        guard let expositionUniverselle = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        guard let decodedExpositionUniverselle = try? decoder.decode(ExpositionUniverselle.self, from: expositionUniverselle.data) else { return }
        
        titleLabel.text = decodedExpositionUniverselle.title
        visitorNumberLabel.text = "방문객 : \(decodedExpositionUniverselle.visitorNumber) 명"
        locationLabel.text = "개최지 : \(decodedExpositionUniverselle.location)"
        durationLabel.text = "개최 기간 : \(decodedExpositionUniverselle.duration)"
        descriptionLabel.text = decodedExpositionUniverselle.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func itemButtonTapped(_ sender: UIButton) {
        guard let itemVC = self.storyboard?.instantiateViewController(withIdentifier: "itemViewController") as? ItemViewController else { return }
        self.navigationController?.pushViewController(itemVC, animated: true)
    }
}
