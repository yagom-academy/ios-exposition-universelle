//
//  mainViewController+extension.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/22.
//

import UIKit

extension MainViewController {
    func updateUI() {
        guard let expoInformation = expoInformation else { return }
        
        setTitleText(of: expoInformation)
        setPosterImage()
        setVisitorsLabel(of: expoInformation)
        setLocationLabel(of: expoInformation)
        setDurationLabel(of: expoInformation)
        setDescriptionLabel(of: expoInformation)
        setStackView()
        setButtonStackView()
        setFlagImage()
    }
    
    func setting() {
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        setScrollView()
        setContentView()
        setStackViewConstraints()
        setFlagImageConstraints()
        setGoToKoreaEntryButton()
        
        stackView.addArrangedSubview(expoTitle)
        stackView.addArrangedSubview(posterImage)
        stackView.addArrangedSubview(visitorsLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(durationLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(leftFlagImage)
        buttonStackView.addArrangedSubview(goToKoreaEntryButton)
        buttonStackView.addArrangedSubview(rightFlagImage)
    }
    
    private func setTitleText(of expoInformation: ExpoInformation) {
        let headTitle = expoInformation.title.split(separator: "(")
        
        expoTitle.numberOfLines = 0
        expoTitle.textAlignment = .center
        expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
    }
    
    private func setPosterImage() {
        posterImage.image = UIImage(named: ExpoNameSpace.expoPoster.name)
    }
    
    private func setVisitorsLabel(of expoInformation: ExpoInformation) {
        guard let expoVisitors = expoInformation.visitors.formatNumber() else { return }
        visitorsLabel.text = ExpoNameSpace.howMany.name + expoVisitors + ExpoNameSpace.visit.name
    }
    
    private func setLocationLabel(of expoInformation: ExpoInformation) {
        locationLabel.text = ExpoNameSpace.where.name + expoInformation.location
    }
    
    private func setDurationLabel(of expoInformation: ExpoInformation) {
        durationLabel.text = ExpoNameSpace.howlong.name + expoInformation.duration
    }
    
    private func setDescriptionLabel(of expoInformation: ExpoInformation) {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.text = expoInformation.description
    }
    
    private func setStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
    }
    
    private func setButtonStackView() {
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
    }
    
    private func setFlagImage() {
        leftFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
        rightFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
    }
    
    private func setGoToKoreaEntryButton() {
        goToKoreaEntryButton.translatesAutoresizingMaskIntoConstraints = false
        goToKoreaEntryButton.setTitle(ExpoNameSpace.koreaEntry.name, for: .normal)
        goToKoreaEntryButton.setTitleColor(.systemBlue, for: .normal)
        goToKoreaEntryButton.addTarget(nil, action: #selector(didTappedButton), for: .touchUpInside)
    }
    
    
    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollViewConstraints = [scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(scrollViewConstraints)
    }
    
    private func setContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let contentViewConstranints = [contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                       contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                       contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                       contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                       contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)]
        NSLayoutConstraint.activate(contentViewConstranints)
    }
    
    private func setStackViewConstraints() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setFlagImageConstraints() {
        NSLayoutConstraint.activate([leftFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     leftFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        NSLayoutConstraint.activate([rightFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     rightFlagImage.widthAnchor.constraint(equalToConstant: 50)])
    }
}
