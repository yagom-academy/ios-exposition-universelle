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
        setNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setExpositionInformation() {
        let expositionInformation = JSONParser<ExpositionInformation>.decode(
            from: "exposition_universelle_1900"
        )
        
        titleLabel.text = expositionInformation?.title
        posterImageView.image = expositionInformation?.poster
        numberOfVisitorsLabel.text = expositionInformation?.visitors
        durationLabel.text = expositionInformation?.duration
        locationLabel.text = expositionInformation?.location
        desciptionTextView.text = expositionInformation?.description
        let nationalFlag = UIImage(named: "flag")
        nationalFlagLeftImage.image = nationalFlag
        nationalFlagRightImage.image = nationalFlag
        transitionToEntriesListButton.setTitle("한국의 출품작 보러가기", for: .normal)
    }
    
    private func setNavigationItem() {
        navigationItem.backButtonTitle = "메인"
    }
}

