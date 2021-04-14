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
    let itemListStackView = UIStackView()

    let expoTitle = UILabel()
    let expoPoster = UIImageView()
    let visitorsTitle = UILabel()
    let visitorsText = UILabel()
    let locationTitle = UILabel()
    let locationText = UILabel()
    let durationTitle = UILabel()
    let durationText = UILabel()
    let expoDescription = UILabel()
    let itemListLeftImage = UIImageView()
    let itemList = UIButton(type: .system)
    let itemListRightImage = UIImageView()
    
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
        
        itemListStackView.axis = .horizontal
        itemListStackView.alignment = .center
        itemListStackView.distribution = .fill
        itemListStackView.spacing = 20
        
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
        
        itemList.setTitle("한국의 출품작 보러가기", for: .normal)
        itemListLeftImage.image = UIImage(named: "flag")
        itemListRightImage.image = UIImage(named: "flag")
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
        addArrangedSubview(itemListStackView)
        
        visitorsStackView.addArrangedSubview(visitorsTitle)
        visitorsStackView.addArrangedSubview(visitorsText)
        locationStackView.addArrangedSubview(locationTitle)
        locationStackView.addArrangedSubview(locationText)
        durationStackView.addArrangedSubview(durationTitle)
        durationStackView.addArrangedSubview(durationText)
        itemListStackView.addArrangedSubview(itemListLeftImage)
        itemListStackView.addArrangedSubview(itemList)
        itemListStackView.addArrangedSubview(itemListRightImage)
        
        itemListLeftImage.translatesAutoresizingMaskIntoConstraints = false
        itemListRightImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemListLeftImage.widthAnchor.constraint(equalToConstant: itemsListImageWidth),
            itemListLeftImage.heightAnchor.constraint(equalToConstant: itemsListImageHeight),
            itemListRightImage.widthAnchor.constraint(equalToConstant: itemsListImageWidth),
            itemListRightImage.heightAnchor.constraint(equalToConstant: itemsListImageHeight)
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
