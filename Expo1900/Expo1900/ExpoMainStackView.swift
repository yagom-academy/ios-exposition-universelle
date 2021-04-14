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
}

extension UIStackView {
    func setSubStackView() {
        axis = .horizontal
        alignment = .fill
        distribution = .fillProportionally
        spacing = 10
    }
}

extension UILabel {
    func setSubTitle() {
        font = UIFont.systemFont(ofSize: 20)
    }
}
