//
//  MainViewController+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/21.
//

import UIKit

extension MainViewController {
    func updateUI() {
        guard let expo = expo else { return }
        
        updateTitle(of: expo)
        updateImage()
        updateVisitorsInformation(of: expo)
        updateLocationInformation(of: expo)
        updateDutrationInformation(of: expo)
        updateDescriptionInformation(of: expo)
        self.navigationController?.navigationBar.topItem?.title = ExpoNameSpace.firstViewcontrollerTitle.name
    }
    
    private func updateTitle(of expo: ExpoInformation) {
        let headTitle = expo.title.split(separator: "(")
        expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
    }
    
    private func updateImage() {
        posterImage.image = UIImage(named: ExpoNameSpace.expoPoster.name)
    }
    
    private func updateVisitorsInformation(of expo: ExpoInformation) {
        guard let expoVisitors = expo.visitors.formatDecimalNumber() else { return }
        numberOfVisitors.text = ExpoNameSpace.howMany.name + expoVisitors + ExpoNameSpace.visit.name
    }
    
    private func updateLocationInformation(of expo: ExpoInformation) {
        expoLocation.text = ExpoNameSpace.where.name + expo.location
    }
    
    private func updateDutrationInformation(of expo: ExpoInformation) {
        let duration = expo.duration.replacingOccurrences(of: "-", with: "~")
        expoDuration.text = ExpoNameSpace.howlong.name + expo.duration
        expoDuration.accessibilityLabel = ExpoNameSpace.howlong.name + duration
    }
    
    private func updateDescriptionInformation(of expo: ExpoInformation) {
        expoDescription.text = expo.description
        expoDescription.accessibilityLabel = "엑스포에 대한 설명입니다."
    }
}
