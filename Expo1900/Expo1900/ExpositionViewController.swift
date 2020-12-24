//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    private var exposition: Exposition?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpositionData()
        updateExpositionInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension ExpositionViewController {
    
    private func decodeExpositionData() {
        
        let jasonDecoder = JSONDecoder()
        guard let assetData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        guard let expositionData = try? jasonDecoder.decode(Exposition.self, from: assetData.data) else {
            return
        }
        exposition = expositionData
    }
    
    private func updateExpositionInfo() {
        
        guard let expositionInfo = exposition else { return }
        
        titleLabel.text = expositionInfo.title
        visitorsLabel.text = "방문객 : \(expositionInfo.visitors) 명"
        locationLabel.text = "개최지 : \(expositionInfo.location)"
        durationLabel.text = "개최 기간 : \(expositionInfo.duration)"
        descriptionLabel.text = expositionInfo.description
    }
}

extension Int {
    func insertComma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: self))!
        return result
    }
}
