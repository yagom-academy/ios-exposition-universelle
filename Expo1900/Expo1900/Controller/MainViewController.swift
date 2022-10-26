//  Expo1900 - ViewController.swift
//  Created by Ayaan, Bella on 2022/10/17.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class MainViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var showKoreanItemListButton: UIButton!
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var rightFlagImageView: UIImageView!
    
    //MARK: - Property
    private var expositionUniverselle: ExpositionUniverselle?
    private let titleText: String = "메인"
    private let posterImageIdentifier: String = "poster"
    private let buttonTitleText: String = "한국의 출품작 보러가기"
    private let flagImageIdentifier: String = "flag"
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchExpositionInformation()
        setUpInitialSetting()
        setUpLabel()
        assignContentValue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }

    //MARK: - Private Method
    private func fetchExpositionInformation() {
        guard let parsedData = JSONParser.parsed(to: ExpositionUniverselle.self) else {
            return
        }
        expositionUniverselle = parsedData
    }
    
    private func setUpInitialSetting() {
        self.title = titleText
        showKoreanItemListButton.setTitle(buttonTitleText, for: .normal)
        leftFlagImageView.image = UIImage(named: flagImageIdentifier)
        rightFlagImageView.image = UIImage(named: flagImageIdentifier)
    }
    
    private func setUpLabel() {
        titleLabel.setUpAccessibility(fontStyle: .title1)
        titleLabel.textAlignment = .center
        visitorLabel.setUpAccessibility(fontStyle: .title3)
        visitorLabel.textAlignment = .center
        locationLabel.setUpAccessibility(fontStyle: .title3)
        locationLabel.textAlignment = .center
        durationLabel.setUpAccessibility(fontStyle: .title3)
        durationLabel.textAlignment = .center
        descriptionLabel.setUpAccessibility(fontStyle: .body)
        descriptionLabel.textAlignment = .center
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
        descriptionLabel.text = expositionUniverselle.description
    }
}
