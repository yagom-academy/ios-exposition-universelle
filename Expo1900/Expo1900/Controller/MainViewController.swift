//  Expo1900 - ViewController.swift
//  Created by Ayaan, Bella on 2022/10/17.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class MainViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: TitleLabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorLabel: BodyLabel!
    @IBOutlet private weak var locationLabel: BodyLabel!
    @IBOutlet private weak var durationLabel: BodyLabel!
    @IBOutlet private weak var descriptionLabel: DescriptionLabel!
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
    
    private func assignContentValue() {
        guard let expositionUniverselle: ExpositionUniverselle = expositionUniverselle else {
            return
        }
        setUpTitleLabel(text: expositionUniverselle.title)
        posterImageView.image = UIImage(named: posterImageIdentifier)
        setUpVisitorLabel(visitor: expositionUniverselle.visitors)
        setUpText(of: locationLabel, text: "개최지 : \(expositionUniverselle.location)")
        setUpText(of: durationLabel, text: "개최 기간 : \(expositionUniverselle.duration)")
        descriptionLabel.text = expositionUniverselle.description
    }
    
    private func setUpText(of label: UILabel, text: String) {
        label.text = text
        label.setUpAttributedText()
    }
    
    private func setUpTitleLabel(text: String) {
        titleLabel.text = text
        
        guard let index = titleLabel.text?.firstIndex(of: "(") else {
            return
        }
        titleLabel.text?.insert("\n", at: index)
    }
    
    private func setUpVisitorLabel(visitor: Int) {
        let decimalNumberFormatter: DecimalNumberFormatter = DecimalNumberFormatter()
        guard let formattedResult = decimalNumberFormatter.formattedNumber(visitor) else {
            return
        }
        setUpText(of: visitorLabel, text: "방문객 : \(formattedResult)명")
    }
}
