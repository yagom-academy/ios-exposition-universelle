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
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.flag)
        imageView.contentMode = .scaleAspectFill
        
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
        self.spacing = 30
        
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
    }
    
    func addConstraintsLeftFlagImageView() {
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)
        
        NSLayoutConstraint.activate([
            leftFlagImageView.heightAnchor.constraint(equalTo: leftFlagImageView.widthAnchor),
            leftFlagImageView.heightAnchor.constraint(equalTo: exhibitListChangeViewButton.heightAnchor)
        ])
    }
    
    func addConstraintsRightFlagImageView() {
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)
        
        NSLayoutConstraint.activate([
            rightFlagImageView.heightAnchor.constraint(equalTo: rightFlagImageView.widthAnchor),
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor)
        ])
    }
}
