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
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    private let mainViewManager: MainViewManager = MainViewManager()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpInitialSetting()
        assignContentValue()
        assignAttributedText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Private Method
    
    private func setUpInitialSetting() {
        self.title = mainViewManager.title
        showKoreanItemListButton.setTitle(mainViewManager.buttonTitle, for: .normal)
        leftFlagImageView.image = mainViewManager.fetchFlagImage()
        rightFlagImageView.image = mainViewManager.fetchFlagImage()
    }
    
    private func assignContentValue() {
        posterImageView.image = mainViewManager.fetchPosterImage()
        titleLabel.text = mainViewManager.expositionTitle
        visitorLabel.text = mainViewManager.expositionVisitors
        locationLabel.text = mainViewManager.expositionLocation
        durationLabel.text = mainViewManager.expositionDuration
        descriptionLabel.text = mainViewManager.expositionDescription
    }
    
    private func assignAttributedText() {
        visitorLabel.setUpAttributedText()
        locationLabel.setUpAttributedText()
        durationLabel.setUpAttributedText()
    }
}
