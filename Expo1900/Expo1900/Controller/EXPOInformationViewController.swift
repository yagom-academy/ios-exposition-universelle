//
//  Expo1900 - EXPOInformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class EXPOInformationViewController: UIViewController {
    var expositionUniverselle: ExpositionUniverselle? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navigationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExpoInformation()
        NavigationBarFormatter.setBackButton(navigationItem, title: "메인")
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
        guard let parsedInformation = JSONData.parse(name: "exposition_universelle_1900",
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
        
        let changeTitle = title.replacingOccurrences(of: "(", with: "\n(")
        
        titleLabel.text = changeTitle
        CustomLabel.setNumberOfLinesToZero(into: descriptionLabel)
        CustomLabel.setLabelFont(into: titleLabel, style: .title2)
    }
    
    private func updateVisitorsLabel() {
        let numberformatter = CustomLabel.setNumberFormat()
        
        guard let visitors = numberformatter.string(for: expositionUniverselle?.visitors) else {
            return
        }
        
        visitorsLabel.text = "방문객 : \(visitors) 명"
    }
    
    private func updateLocationLabel() {
        guard let location = expositionUniverselle?.location else {
            return
        }
        
        locationLabel.text = "개최지 : \(location)"
    }
    
    private func updateDurationLabel() {
        guard let duration = expositionUniverselle?.duration else {
            return
        }
        
        durationLabel.text = "개최기간 : \(duration)"
    }
    
    private func updateDescriptionLabel() {
        guard let description = expositionUniverselle?.description else {
            return
        }
        
        descriptionLabel.text = description
        CustomLabel.setNumberOfLinesToZero(into: descriptionLabel)
        CustomLabel.setLineBreakMode(into: descriptionLabel, style: .byWordWrapping)
    }
    
    @IBAction private func navigationButtonDidTap(_ sender: UIButton) {
        goToKoreaEntryView()
    }
    
    private func goToKoreaEntryView() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "KoreaEntryViewController") as? KoreaEntryViewController else {
            return
        }

        self.navigationController?.pushViewController(controller, animated: true)
    }
}

