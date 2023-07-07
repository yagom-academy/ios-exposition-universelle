//
//  ChangeViewButtonStackView.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/30.
//

import UIKit

class ChangeViewButtonStackView: UIStackView {
    let changeViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(LabelTextNamespace.buttonTitle, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = .zero
        button.titleLabel?.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true

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
        
        let leftFlagView: UIImageView = createFlagImageView()
        let rightFlagView: UIImageView = createFlagImageView()
        
        self.addArrangedSubview(leftFlagView)
        self.addArrangedSubview(changeViewButton)
        self.addArrangedSubview(rightFlagView)
        
        NSLayoutConstraint.activate([
            rightFlagView.widthAnchor.constraint(equalTo: leftFlagView.widthAnchor),
            leftFlagView.heightAnchor.constraint(equalTo: changeViewButton.heightAnchor),
            changeViewButton.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: MultiplierNamespace.buttonWidthToButtonStackView
            )
        ])
    }
    
    private func createFlagImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetNamespace.flag)
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)

        return imageView
    }
}
