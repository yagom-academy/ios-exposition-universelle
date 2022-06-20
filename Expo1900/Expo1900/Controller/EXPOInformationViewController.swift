//
//  Expo1900 - EXPOInformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class EXPOInformationViewController: UIViewController {
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
        NavigationBarFormatter.setTitle(navigationItem, title: NameSpace.firstVCTitle.name)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
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
    
    private func updatePosterDescription() {
        updateTitleLabel()
        updateVisitorsLabel()
        updateLocationLabel()
        updateDurationLabel()
        updateDescriptionLabel()
    }
    
    private func updateTitleLabel() {
        guard let title = expositionUniverselle?.title else {
            return
        }
        
        let changeTitle = title.replacingOccurrences(of: NameSpace.bracket.name, with: NameSpace.bracketWithLineBreak.name)
        
        self.titleLabel.text = changeTitle
        CustomLabel.setNumberOfLinesToZero(into: descriptionLabel)
        CustomLabel.setLabelFont(into: titleLabel, style: .title2)
    }
    
    private func updateVisitorsLabel() {
        let numberformatter = CustomLabel.setNumberFormat()
        
        guard let visitors = numberformatter.string(for: expositionUniverselle?.visitors) else {
            return
        }
        
        self.visitorsLabel.text = NameSpace.visitors.name + String(visitors) + NameSpace.numberOfPeople.name
    }
    
    private func updateLocationLabel() {
        guard let location = expositionUniverselle?.location else {
            return
        }
        
        self.locationLabel.text = NameSpace.location.name +  String(location)
    }
    
    private func updateDurationLabel() {
        guard let duration = expositionUniverselle?.duration else {
            return
        }
        
        self.durationLabel.text = NameSpace.duration.name + String(duration)
    }
    
    private func updateDescriptionLabel() {
        guard let description = expositionUniverselle?.description else {
            return
        }
        
        self.descriptionLabel.text = description
        CustomLabel.setNumberOfLinesToZero(into: descriptionLabel)
        CustomLabel.setLineBreakMode(into: descriptionLabel, style: .byWordWrapping)
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
}

