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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let expositionUniverselles = CustomJsonDecoder.jsonFileDecode(fileName: "exposition_universelle_1900", model: ExpositionUniverselle.self)
        switch expositionUniverselles {
        case .success(let result):
            configureView(data: result)
        case .failure(let error):
            print(error.rawValue)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func configureView(data: ExpositionUniverselle) {
        titleLabel.text = data.title
        visitorsLabel.text = String(data.visitors)
        locationLabel.text = data.location
        durationLabel.text = data.duration
        descLabel.text = data.description
    }
    
}
