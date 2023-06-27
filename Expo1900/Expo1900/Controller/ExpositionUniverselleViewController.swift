//
//  Expo1900 - ExpositionUniverselleViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionUniverselleViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let json = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let decoder = JSONDecoder()
        do {
            let expositionUniverselle = try decoder.decode(ExpositionUniverselle.self, from: json.data)
            titleLabel.text = expositionUniverselle.title
            visitorsLabel.text = "방문객 : " + String(expositionUniverselle.visitors) + "명"
            locationLabel.text = "개최지 : " + expositionUniverselle.location
            durationLabel.text = "개최 기간 : " + expositionUniverselle.duration
            descriptionLabel.text = expositionUniverselle.description
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction private func tapShowItemsButton(_ sender: UIButton) {
        
    }
    
    private func formatNumber(of number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number) ?? "0"
    }
}
