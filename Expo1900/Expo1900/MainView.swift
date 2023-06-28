//
//  MainView.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/28.
//

import UIKit

class MainView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints  = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .blue
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let contentStackView: UIStackView = {
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 8
        contentStackView.alignment = .center
        contentStackView.distribution = .equalSpacing
        contentStackView.backgroundColor = .yellow
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        return contentStackView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "제목"
        return titleLabel
    }()
    
    let visitorsLabel: UILabel = {
        let visitorsLabel = UILabel()
        visitorsLabel.text = "방문객"
        return visitorsLabel
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.numberOfLines = 0
        locationLabel.text = "위치"
        return locationLabel
    }()
    
    let durationLabel: UILabel = {
        let durationLabel = UILabel()
        durationLabel.text = "기간"
        return durationLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "디테일"
        return descriptionLabel
    }()
    
    let infoImage: UIImageView = {
        let infoImage = UIImageView()
        infoImage.image = UIImage(named: "poster")
        return infoImage
    }()
    
    let leftImage: UIImageView = {
        let leftImage = UIImageView()
        leftImage.image = UIImage(named: "flag")
        return leftImage
    }()
    
    let rightImage: UIImageView = {
        let rightImage = UIImageView()
        rightImage.image = UIImage(named: "flag")
        return rightImage
    }()
    
    let koreaExpositionButton: UIButton = {
        let koreaExpositionButton = UIButton()
        koreaExpositionButton.setTitle("한국 박람회 전시", for: .normal)
        return koreaExpositionButton
    }()
    
    let bottomStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 30
        bottomStackView.distribution = .equalSpacing
        bottomStackView.backgroundColor = .brown
        return bottomStackView
    }()
    
    convenience init() {
        self.init(frame: CGRectZero)
        
        configureUI()
        setUpContraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [leftImage, koreaExpositionButton, rightImage].forEach {
            bottomStackView.addArrangedSubview($0)
        }

        [titleLabel, infoImage, visitorsLabel, locationLabel, durationLabel, descriptionLabel, bottomStackView].forEach {
            contentStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(contentStackView)
        scrollView.addSubview(contentView)
        addSubview(scrollView)
}
    
    private func setUpContraints() {
        setUpScrollViewConstraints()
        setUpContentViewConstraints()
        setUpContentStackViewConstraints()
        setUpImageViewConstraints()
    }
}

// MARK: - Constraints
extension MainView {
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 1)
        ])
        
        let contentViewHeightConstraints = contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: 1)
        contentViewHeightConstraints.priority = .init(1)
        contentViewHeightConstraints.isActive = true
    }
    
    private func setUpContentStackViewConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            leftImage.heightAnchor.constraint(equalToConstant: 40),
            leftImage.widthAnchor.constraint(equalToConstant: 60),
            rightImage.heightAnchor.constraint(equalToConstant: 40),
            rightImage.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
