//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var itemsbutton: UIButton!
    
    var expositionUniverselles: ExpositionUniverselle = ExpositionUniverselle(title: "", visitors: 0, location: "", duration: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonPaser()
        configureView(data: expositionUniverselles)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func jsonPaser() {
        let jsonDecoder = JSONDecoder()
        guard let expositionUniversellesData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        do {
            self.expositionUniverselles = try jsonDecoder.decode(ExpositionUniverselle.self, from: expositionUniversellesData.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func configureView(data: ExpositionUniverselle) {
        titleLabel.text = data.title
        visitorsLabel.text = String(data.visitors)
        locationLabel.text = data.location
        durationLabel.text = data.duration
        descLabel.text = data.description
    }
    
}
