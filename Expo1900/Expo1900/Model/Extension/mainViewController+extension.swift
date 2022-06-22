//
//  mainViewController+extension.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/22.
//

import UIKit

extension MainViewController {
    func updateUI() {
        guard let expoInformation = expoInformation else { return }
        
        setTitleText(of: expoInformation)
        setPosterImage()
        setVisitorsLabel(of: expoInformation)
        setLocationLabel(of: expoInformation)
        setDurationLabel(of: expoInformation)
        setDescriptionLabel(of: expoInformation)
    }
    
    private func setTitleText(of expoInformation: ExpoInformation) {
        let headTitle = expoInformation.title.split(separator: "(")
        expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
    }
    
    private func setPosterImage() {
        posterImage.image = UIImage(named: ExpoNameSpace.expoPoster.name)
    }
    
    private func setVisitorsLabel(of expoInformation: ExpoInformation) {
        guard let expoVisitors = expoInformation.visitors.formatNumber() else { return }
        visitorsLabel.text = ExpoNameSpace.howMany.name + expoVisitors + ExpoNameSpace.visit.name
    }
    
    private func setLocationLabel(of expoInformation: ExpoInformation) {
        locationLabel.text = ExpoNameSpace.where.name + expoInformation.location
    }
    
    private func setDurationLabel(of expoInformation: ExpoInformation) {
        durationLabel.text = ExpoNameSpace.howlong.name + expoInformation.duration
    }
    
    private func setDescriptionLabel(of expoInformation: ExpoInformation) {
        descriptionLabel.text = expoInformation.description
    }
}
