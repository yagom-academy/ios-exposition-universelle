//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var showKoreanItemListButton: UIButton!
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var rightFlagImageView: UIImageView!
    
    private var expositionUniverselle: ExpositionUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMainViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assignContentValue()
    }
    
    private func loadMainViewData() {
        guard let mainViewDataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            self.expositionUniverselle = try decoder.decode(ExpositionUniverselle.self, from: mainViewDataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func assignContentValue() {
        guard let expositionUniverselle: ExpositionUniverselle = expositionUniverselle else {
            return
        }
        self.title = "메인"
        self.navigationController?.isNavigationBarHidden = true
        titleLabel.text = expositionUniverselle.title
        posterImageView.image = UIImage(named: "poster")
        visitorLabel.text = "방문객 : \(expositionUniverselle.visitors)명"
        locationLabel.text = "개최지 : \(expositionUniverselle.location)"
        durationLabel.text = "개최 기간 : \(expositionUniverselle.duration)"
        descriptionTextView.text = expositionUniverselle.description
        showKoreanItemListButton.setTitle("한국의 출품작 보러가기", for: .normal)
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
    }
}
