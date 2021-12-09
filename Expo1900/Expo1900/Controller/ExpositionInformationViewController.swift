//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionInformationViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var numberOfVisitorsLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var desciptionTextView: UITextView!
    @IBOutlet private weak var nationalFlagLeftImage: UIImageView!
    @IBOutlet private weak var transitionToEntriesListButton: UIButton!
    @IBOutlet private weak var nationalFlagRightImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpositionInformation()
    }
    
    private func setExpositionInformation() {
        guard let expositionInformationData = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        let expositionInformation = try? JSONDecoder().decode(ExpositionInformation.self, from: expositionInformationData.data)
        titleLabel.text = expositionInformation?.title
        posterImageView.image = expositionInformation?.poster
        numberOfVisitorsLabel.text = expositionInformation?.visitors
        durationLabel.text = expositionInformation?.duration
        locationLabel.text = expositionInformation?.location
        desciptionTextView.text = expositionInformation?.description
        let nationalFlag = UIImage(named: "flag")
        nationalFlagLeftImage.image = nationalFlag
        nationalFlagRightImage.image = nationalFlag
        transitionToEntriesListButton.titleLabel?.text = "한국의 출품작 보러가기"
    }
}

