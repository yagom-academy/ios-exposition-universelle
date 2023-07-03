//
//  ChangeViewButtonStackView.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/30.
//

import UIKit

class ChangeViewButtonStackView: UIStackView {
    let leftFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetNamespace.flag)
        
        return imageView
    }()
    
    let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetNamespace.flag)
        
        return imageView
    }()
    
    let changeViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(LabelTextNamespace.buttonTitle, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.axis = .horizontal
        self.spacing = SpacingNamespace.changeViewButton
        self.addArrangedSubview(leftFlagImageView)
        self.addArrangedSubview(changeViewButton)
        self.addArrangedSubview(rightFlagImageView)
        
        changeViewButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        changeViewButton.setContentCompressionResistancePriority(.required, for: .vertical)
        leftFlagImageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        leftFlagImageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        rightFlagImageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        rightFlagImageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        
        NSLayoutConstraint.activate([
            leftFlagImageView.heightAnchor.constraint(equalTo: leftFlagImageView.widthAnchor, multiplier: MultiplierNamespace.flagImageHeightToWidth),
            rightFlagImageView.heightAnchor.constraint(equalTo: rightFlagImageView.widthAnchor, multiplier: MultiplierNamespace.flagImageHeightToWidth),
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor),
            leftFlagImageView.heightAnchor.constraint(equalTo: changeViewButton.heightAnchor)
        ])
    }
}
