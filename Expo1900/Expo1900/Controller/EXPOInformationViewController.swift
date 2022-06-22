//
//  Expo1900 - EXPOInformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class EXPOInformationViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var navigationButton: UIButton!
    
    private let appdelegate = UIApplication.shared.delegate as! AppDelegate
    private var expositionUniverselle: ExpositionUniverselle?
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExpoInformation()
        navigationItem.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appdelegate.shouldSupportAllOrientation = false
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        appdelegate.shouldSupportAllOrientation = true
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - UI
extension EXPOInformationViewController {
    private func setupExpoInformation() {
        parseExpositionUniverselleData()
        updatePosterDescription()
    }
    
    private func parseExpositionUniverselleData() {
        guard let parsedInformation = JSONData.parse(
            name: NameSpace.expoInfoData.name,
            to: expositionUniverselle) else {
            return
        }
        
        expositionUniverselle = parsedInformation
    }
    
    private func updatePosterDescription() {
        guard let expositionUniverselle = expositionUniverselle else {
            return
        }
        
        updateTitleLabel(from: expositionUniverselle)
        updateVisitorsLabel(from: expositionUniverselle)
        updateLocationLabel(from: expositionUniverselle)
        updateDurationLabel(from: expositionUniverselle)
        updateDescriptionLabel(from: expositionUniverselle)
    }
    
    private func updateTitleLabel(from expo: ExpositionUniverselle) {
        let title = expo.title
        let changeTitle = title.replacingOccurrences(of: "(", with: "\n(")
        
        titleLabel.text = changeTitle
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.numberOfLines = 0
    }
    
    private func updateVisitorsLabel(from expo: ExpositionUniverselle) {
        let numberformatter = visitorsLabel.setNumberFormat(style: .decimal)
        
        guard let visitors = numberformatter.string(for: expo.visitors) else {
            return
        }
        
        visitorsLabel.text = "방문객 : \(visitors) 명"
    }
    
    private func updateLocationLabel(from expo: ExpositionUniverselle) {
        let location = expo.location
        
        locationLabel.text = "개최지 : \(location)"
    }
    
    private func updateDurationLabel(from expo: ExpositionUniverselle) {
        let duration = expo.duration
        
        durationLabel.text = "개최 기간 : \(duration)"
    }
    
    private func updateDescriptionLabel(from expo: ExpositionUniverselle) {
        let description = expositionUniverselle?.description
        
        descriptionLabel.text = description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
}

// MARK: - Action
extension EXPOInformationViewController {
    @IBAction private func tapNavigationButton(_ sender: UIButton) {
        goToKoreaEntryView()
    }
    
    private func goToKoreaEntryView() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: NameSpace.koreaEntryViewControllerId.name) as? KoreaEntryViewController else {
            return
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
