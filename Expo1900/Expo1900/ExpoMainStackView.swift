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
        
        setSubviewsAttribute()
        setSubviewsConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviewsAttribute()
        setSubviewsConstraints()
    }
    
    func setSubviewsAttribute() {
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
        
        expoDescription.textAlignment = .left
        expoDescription.numberOfLines = 0
        expoDescription.lineBreakMode = .byWordWrapping
        
        itemsList.setTitle("한국의 출품작 보러가기", for: .normal)
        itemsListLeftImage.image = UIImage(named: "flag")
        itemsListRightImage.image = UIImage(named: "flag")
    }
    
    func setSubviewsConstraints() {
        let itemsListImageWidth: CGFloat = 40
        let itemsListImageHeight: CGFloat = 30
        
        addArrangedSubview(expoTitle)
        addArrangedSubview(expoPoster)
        addArrangedSubview(visitorsStackView)
        addArrangedSubview(locationStackView)
        addArrangedSubview(durationStackView)
        addArrangedSubview(expoDescription)
        addArrangedSubview(itemsListStackView)
        
        visitorsStackView.addArrangedSubview(visitorsTitle)
        visitorsStackView.addArrangedSubview(visitorsText)
        locationStackView.addArrangedSubview(locationTitle)
        locationStackView.addArrangedSubview(locationText)
        durationStackView.addArrangedSubview(durationTitle)
        durationStackView.addArrangedSubview(durationText)
        itemsListStackView.addArrangedSubview(itemsListLeftImage)
        itemsListStackView.addArrangedSubview(itemsList)
        itemsListStackView.addArrangedSubview(itemsListRightImage)
        
        itemsListLeftImage.translatesAutoresizingMaskIntoConstraints = false
        itemsListRightImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemsListLeftImage.widthAnchor.constraint(equalToConstant: itemsListImageWidth),
            itemsListLeftImage.heightAnchor.constraint(equalToConstant: itemsListImageHeight),
            itemsListRightImage.widthAnchor.constraint(equalToConstant: itemsListImageWidth),
            itemsListRightImage.heightAnchor.constraint(equalToConstant: itemsListImageHeight)
        ])
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
