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
        self.navigationController?.navigationBar.topItem?.title = "메인"
    }
    
    private func updateTitle(of expo: ExpoInformation) {
        let headTitle = expo.title.split(separator: "(")
        expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
    }
    
    private func updateImage() {
        posterImage.image = UIImage(named: "poster")
    }
    
    private func updateVisitorsInformation(of expo: ExpoInformation) {
        numberOfVisitors.text = "방문객 : " + (expo.visitors.formatDecimalNumber() ?? "") + "명"
    }
    
    private func updateLocationInformation(of expo: ExpoInformation) {
        expoLocation.text = "개최지 : " + expo.location
    }
    
    private func updateDutrationInformation(of expo: ExpoInformation) {
        expoDuration.text = "개최 기간 : " + expo.duration
    }
    
    private func updateDescriptionInformation(of expo: ExpoInformation) {
        expoDescription.text = expo.description
    }
}
