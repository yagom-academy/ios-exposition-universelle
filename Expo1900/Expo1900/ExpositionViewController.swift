//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var englishTitleLabel: UILabel!
    @IBOutlet weak var visitorsNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let expositionDataModel = DataModel<Exposition>(fileName: "exposition_universelle_1900")
    private var expositionData: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.expositionData = try expositionDataModel.requestData()
        } catch {
            print(error.localizedDescription)
        }
    
        guard let expositionData = self.expositionData else { return }
        titleLabel.text = expositionData.title
        visitorsNumberLabel.text = "방문객 : \(expositionData.visitorsNumber)"
        locationLabel.text = "개최지 : \(expositionData.location)"
        durationLabel.text = "개최 기간 : \(expositionData.duration)"
        descriptionLabel.text = expositionData.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
}

