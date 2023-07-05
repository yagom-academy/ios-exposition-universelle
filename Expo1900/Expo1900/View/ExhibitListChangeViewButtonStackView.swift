//
//  ExhibitListChangeViewButtonStackView.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class ExhibitListChangeViewButtonStackView: UIStackView {
    private let leftFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.flag)
        return imageView
    }()
    
    private let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.flag)
        return imageView
    }()
    
    let exhibitListChangeViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(DataNamespace.buttonTitle, for: .normal)
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
}

private extension ExhibitListChangeViewButtonStackView {
    func configureUI() {
        self.axis = .horizontal
        self.spacing = 30
        self.addArrangedSubview(leftFlagImageView)
        self.addArrangedSubview(exhibitListChangeViewButton)
        self.addArrangedSubview(rightFlagImageView)
        
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .horizontal)
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .vertical)
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)
        
        NSLayoutConstraint.activate([
            leftFlagImageView.heightAnchor.constraint(equalTo: leftFlagImageView.widthAnchor, multiplier: 0.65),
            rightFlagImageView.heightAnchor.constraint(equalTo: rightFlagImageView.widthAnchor, multiplier: 0.65),
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor),
            leftFlagImageView.heightAnchor.constraint(equalTo: exhibitListChangeViewButton.heightAnchor)
        ])
    }
}
