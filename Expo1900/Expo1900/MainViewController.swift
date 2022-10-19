//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    private var expositionUniverselle: ExpositionUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpoInformation()
        setTextToDisplay()
    }
    
    private func fetchExpoInformation() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionUniverselle = try jsonDecoder.decode(ExpositionUniverselle.self,
                                                                from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setTextToDisplay() {
        guard let expositionUniverselle = expositionUniverselle else {
            return
        }
        
        titleLabel.text = expositionUniverselle.title
        visitorsLabel.text = "방문객 : \(expositionUniverselle.visitors) 명"
        locationLabel.text = "개최지 : " + expositionUniverselle.location
        durationLabel.text = "개최 기간 : " + expositionUniverselle.duration
        descriptionTextView.text = expositionUniverselle.description
    }
}

