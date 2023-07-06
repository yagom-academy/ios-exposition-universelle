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
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.flag)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let exhibitListChangeViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(DataNamespace.buttonTitle, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureInit()
    }
}

private extension ExhibitListChangeViewButtonStackView {
    func configureInit() {
        self.axis = .horizontal
        
        addArrangedSubviews()
        addConstraintsChangeViewButton()
        addConstraintsLeftFlagImageView()
        addConstraintsRightFlagImageView()
    }
    
    func addArrangedSubviews() {
        self.addArrangedSubview(leftFlagImageView)
        self.addArrangedSubview(exhibitListChangeViewButton)
        self.addArrangedSubview(rightFlagImageView)
    }
    
    func addConstraintsChangeViewButton() {
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .horizontal)
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .vertical)

        exhibitListChangeViewButton.titleLabel?.heightAnchor.constraint(equalTo: exhibitListChangeViewButton.heightAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            exhibitListChangeViewButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6)
        ])
    }

    func addConstraintsLeftFlagImageView() {
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)

        NSLayoutConstraint.activate([
            leftFlagImageView.heightAnchor.constraint(equalTo: exhibitListChangeViewButton.heightAnchor)
        ])

    }

    func addConstraintsRightFlagImageView() {
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)

        NSLayoutConstraint.activate([
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor),
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor)
        ])
    }
}
