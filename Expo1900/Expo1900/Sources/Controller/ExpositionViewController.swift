//
//  Expo1900 - ExpositionViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = "메인"
        
        let expositionUniverselle = decodeJson()
        
        titleLabel.text = expositionUniverselle.title
        visitorNumberLabel.text = "방문객 : \(expositionUniverselle.visitorNumber) 명"
        locationLabel.text = "개최지 : \(expositionUniverselle.location)"
        durationLabel.text = "개최 기간 : \(expositionUniverselle.duration)"
        descriptionLabel.text = expositionUniverselle.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeJson() -> ExpositionUniverselle {
        let decoder = JSONDecoder()
        let emptydata: ExpositionUniverselle = .init(title: "", visitorNumber: 0, location: "", duration: "", description: "")
        
        guard let expositionUniverselle = NSDataAsset(name: "exposition_universelle_1900") else { return emptydata }
        
        guard let decodedExpositionUniverselle = try? decoder.decode(ExpositionUniverselle.self, from: expositionUniverselle.data) else { return emptydata }
        
        return decodedExpositionUniverselle
    }
    
    @IBAction func itemButtonTapped(_ sender: UIButton) {
        guard let itemVC = self.storyboard?.instantiateViewController(withIdentifier: "itemViewController") as? ItemViewController else { return }
        
        self.navigationController?.pushViewController(itemVC, animated: true)
    }
}
