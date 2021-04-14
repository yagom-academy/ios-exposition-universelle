//
//  ExpoMainStackView.swift
//  Expo1900
//
//  Created by TORI on 2021/04/14.
//

import UIKit

class ExpoMainStackView: UIStackView {

    let visitorsStackView = UIStackView()
    let locationStackView = UIStackView()
    let durationStackView = UIStackView()
    let itemsListStackView = UIStackView()

    let expoTitle = UILabel()
    let expoPoster = UIImageView()
    let visitorsTitle = UILabel()
    let visitorsText = UILabel()
    let locationTitle = UILabel()
    let locationText = UILabel()
    let durationTitle = UILabel()
    let durationText = UILabel()
    let expoDescription = UILabel()
    let itemsListLeftImage = UIImageView()
    let itemsList = UIButton(type: .system)
    let itemsListRightImage = UIImageView()
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setAttribute() {
        axis = .vertical
        alignment = .center
        distribution = .fill
        spacing = 10
        
        visitorsStackView.setSubStackView()
        locationStackView.setSubStackView()
        durationStackView.setSubStackView()
        
        itemsListStackView.axis = .horizontal
        itemsListStackView.alignment = .center
        itemsListStackView.distribution = .fill
        itemsListStackView.spacing = 20
        
        expoTitle.font = UIFont.systemFont(ofSize: 24)
        
        expoPoster.image = UIImage(named: "poster")
        
        visitorsTitle.font = UIFont.systemFont(ofSize: 20)
        locationTitle.font = UIFont.systemFont(ofSize: 20)
        durationTitle.font = UIFont.systemFont(ofSize: 20)
        visitorsTitle.text = "방문객 :"
        locationTitle.text = "개최지 :"
        durationTitle.text = "개최 기간 :"
        
        expoDescription.numberOfLines = 0
        expoDescription.lineBreakMode = .byWordWrapping
        
        itemsList.setTitle("한국의 출품작 보러가기", for: .normal)
        itemsListLeftImage.image = UIImage(named: "flag")
        itemsListRightImage.image = UIImage(named: "flag")
    }
}

extension UIStackView {
    func setSubStackView() {
        axis = .horizontal
        alignment = .fill
        distribution = .fillProportionally
        spacing = 10
    }
}
