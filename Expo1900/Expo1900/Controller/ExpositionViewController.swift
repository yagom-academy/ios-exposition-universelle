//
//  Expo1900 - ViewController.swift
//  Created by jyubong, mireu
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exposition = Decoder<Exposition>(assetName: "exposition_universelle_1900").decodedItem
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    private func configureUI () {
        titleLabel.text = exposition?.title
        visitorsLabel.text = String(subTitle: "방문객", text: exposition?.visitorsDescription)
        locationLabel.text = String(subTitle: "개최지", text: exposition?.location)
        durationLabel.text = String(subTitle: "개최 기간", text: exposition?.duration)
        descriptionLabel.text = exposition?.description
    }
    
}
