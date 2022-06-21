//
//  Expo1900 - EXPOInformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class EXPOInformationViewController: UIViewController {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    private var expositionUniverselle: ExpositionUniverselle?
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var navigationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExpoInformation()
        self.navigationItem.setTitle(NameSpace.firstVCTitle.name)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appdelegate.shouldSupportAllOrientation = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        appdelegate.shouldSupportAllOrientation = true
        self.navigationController?.isNavigationBarHidden = false
    }

    private func setupExpoInformation() {
        parseExpositionUniverselleData()
        updatePosterDescription()
    }
    
    private func parseExpositionUniverselleData() {
        guard let parsedInformation = JSONData.parse(name: NameSpace.expoInfoData.name,
                                                     to: expositionUniverselle) else {
            return
        }
        
        expositionUniverselle = parsedInformation
    }
    
    @IBAction private func navigationButtonDidTap(_ sender: UIButton) {
        goToKoreaEntryView()
    }
    
    private func goToKoreaEntryView() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: NameSpace.koreaEntryViewControllerId.name) as? KoreaEntryViewController else {
            return
        }

        self.navigationController?.pushViewController(controller, animated: true)
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
        
        let changeTitle = title.replacingOccurrences(of: NameSpace.bracket.name, with: NameSpace.bracketWithLineBreak.name)
        
        self.titleLabel.text = changeTitle
        self.descriptionLabel.setNumberOfLines(0)
        self.titleLabel.setLabelFont(style: .title2)
    }
    
    private func updateVisitorsLabel(from expo: ExpositionUniverselle) {
        let numberformatter = self.visitorsLabel.setNumberFormat(style: .decimal)
        
        guard let visitors = numberformatter.string(for: expo.visitors) else {
            return
        }
        
        self.visitorsLabel.text = NameSpace.visitors.name + String(visitors) + NameSpace.numberOfPeople.name
    }
    
    private func updateLocationLabel(from expo: ExpositionUniverselle) {
        let location = expo.location
        
        self.locationLabel.text = NameSpace.location.name +  String(location)
    }
    
    private func updateDurationLabel(from expo: ExpositionUniverselle) {
        let duration = expo.duration
        
        self.durationLabel.text = NameSpace.duration.name + String(duration)
    }
    
    private func updateDescriptionLabel(from expo: ExpositionUniverselle) {
        let description = expositionUniverselle?.description

        self.descriptionLabel.text = description
        self.descriptionLabel.setNumberOfLines(0)
        self.descriptionLabel.setLineBreakMode(style: .byWordWrapping)
    }
}
