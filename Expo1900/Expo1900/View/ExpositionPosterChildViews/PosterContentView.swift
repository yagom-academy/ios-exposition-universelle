//
//  PosterContentView.swift
//  Expo1900
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

class PosterContentView: UIView {
    let posterImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "poster"))
        return image
    }()
    let titleLabel = InformationLabel(aligment: .center, settingFont: .systemFont(ofSize: 20, weight: .bold), lines: 0)
    let visitorsLabel = InformationLabel()
    let locationLabel = InformationLabel()
    let durationLabel = InformationLabel()
    let descriptionLabel = InformationLabel(aligment: .natural, settingFont: nil, lines: 0)
    let flagButton = FlagButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setLayout()
    }
    
    func setViewData(exposition: Exposition?) {
        titleLabel.text = exposition?.titleData
        visitorsLabel.text = exposition?.visitorsData
        locationLabel.text = exposition?.locationData
        durationLabel.text = exposition?.durationData
        descriptionLabel.text = exposition?.description
    }
}

// MARK: - layout 설정
extension PosterContentView {
    private func setLayout() {
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
    
    private func setContentsChildView() {
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
    
    private func setTitleLabelLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func setPosterImageViewLayout() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            posterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func setVisitorsLabelLayout() {
        NSLayoutConstraint.activate([
            visitorsLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            visitorsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            visitorsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func setLocationLabelLayout() {
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func setDurationLabelLayout() {
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            durationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func setDescriptionLabelLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: flagButton.topAnchor),
        ])
    }
    
    private func setFlagButtonLayout() {
        NSLayoutConstraint.activate([
            flagButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            flagButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            flagButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
