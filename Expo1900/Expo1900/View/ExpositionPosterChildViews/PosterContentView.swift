//  posterContentDelegate.swift
//  posterContentDelegate
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

protocol posterContentDelegate: AnyObject {
    func didTappedEntityButton()
}

final class PosterContentView: UIView {
    private let posterImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: Constant.posterImageName))
        return image
    }()
    private let titleLabel = InformationLabel(alignment: .center, settingFont: UIFont.preferredFont(forTextStyle: .title1), lines: 0)
    private let visitorsLabel = InformationLabel(alignment: .center)
    private let locationLabel = InformationLabel(alignment: .center)
    private let durationLabel = InformationLabel(alignment: .center)
    private let descriptionLabel = InformationLabel(alignment: .natural)
    private let flagButton = FlagButton()
    weak var delegate: posterContentDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        addFlagButtonAction()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setLayout()
    }
    
    private func addFlagButtonAction() {
        flagButton.addTarget(self, action: #selector(didTappedEntityButton), for: .touchUpInside)
    }
    
    func setViewData(exposition: Exposition?) {
        titleLabel.text = exposition?.title
        visitorsLabel.text = exposition?.visitors
        locationLabel.text = exposition?.location
        durationLabel.text = exposition?.duration
        descriptionLabel.text = exposition?.description
    }
}

// MARK: - Objc Method
private extension PosterContentView {
    @objc func didTappedEntityButton() {
        delegate?.didTappedEntityButton()
    }
}

// MARK: - layout 설정
private extension PosterContentView {
    func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        setContentsChildView()
        
        setTitleLabelLayout()
        setPosterImageViewLayout()
        setVisitorsLabelLayout()
        setLocationLabelLayout()
        setDurationLabelLayout()
        setDescriptionLabelLayout()
        setFlagButtonLayout()
    }
    
    func setContentsChildView() {
        let layoutList: [UIView] = [
            titleLabel,
            posterImageView,
            visitorsLabel,
            locationLabel,
            durationLabel,
            descriptionLabel,
            flagButton
        ]
        
        layoutList.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
            addSubview(element)
        }
    }
    
    func setTitleLabelLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
        ])
    }
    
    func setPosterImageViewLayout() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            posterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func setVisitorsLabelLayout() {
        NSLayoutConstraint.activate([
            visitorsLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            visitorsLabel.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor,
                                                   constant: 16),
            visitorsLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            visitorsLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setLocationLabelLayout() {
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func setDurationLabelLayout() {
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            durationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func setDescriptionLabelLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: flagButton.topAnchor),
        ])
    }
    
    func setFlagButtonLayout() {
        NSLayoutConstraint.activate([
            flagButton.leadingAnchor.constraint(lessThanOrEqualTo: descriptionLabel.leadingAnchor),
            flagButton.trailingAnchor.constraint(lessThanOrEqualTo: descriptionLabel.trailingAnchor),
            flagButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            flagButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
