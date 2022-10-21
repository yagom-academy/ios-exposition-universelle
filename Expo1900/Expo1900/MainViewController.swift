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
    private let titleText: String = "메인"
    private let posterImageIdentifier: String = "poster"
    private let buttonTitleText: String = "한국의 출품작 보러가기"
    private let flagImageIdentifier: String = "flag"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMainViewData()
        setUpInitialSetting()
        assignContentValue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func loadMainViewData() {
        guard let mainViewDataAsset: NSDataAsset = NSDataAsset(name: DataAsset.expositionUniverselleInfomation) else {
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            self.expositionUniverselle = try decoder.decode(ExpositionUniverselle.self, from: mainViewDataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setUpInitialSetting() {
        self.title = titleText
        showKoreanItemListButton.setTitle(buttonTitleText, for: .normal)
        leftFlagImageView.image = UIImage(named: flagImageIdentifier)
        rightFlagImageView.image = UIImage(named: flagImageIdentifier)
    }
    
    private func assignContentValue() {
        guard let expositionUniverselle: ExpositionUniverselle = expositionUniverselle else {
            return
        }
        titleLabel.text = expositionUniverselle.title
        posterImageView.image = UIImage(named: posterImageIdentifier)
        visitorLabel.text = "방문객 : \(expositionUniverselle.visitors)명"
        locationLabel.text = "개최지 : \(expositionUniverselle.location)"
        durationLabel.text = "개최 기간 : \(expositionUniverselle.duration)"
        descriptionTextView.text = expositionUniverselle.description
    }
}
