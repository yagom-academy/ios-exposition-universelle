//
//  mainViewController+extension.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/22.
//

import UIKit

extension MainViewController {
    func setUI() {
        guard let expoInformation = expoInformation else { return }
        
        self.setTitleText(of: expoInformation)
        self.setVisitorsLabel(of: expoInformation)
        self.setLocationLabel(of: expoInformation)
        self.setDurationLabel(of: expoInformation)
        self.setDescriptionLabel(of: expoInformation)
        self.setStackView()
        self.setButtonStackView()
        self.setStackViewSubviews()
        self.setDelegates()
        self.setConstraints()
    }
    
    private func setNavigation() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setConstraints() {
        self.setScrollViewConstraints()
        self.setContentViewConstraints()
        self.setStackViewConstraints()
        self.setFlagImageConstraints()
    }
    
    private func setDelegates() {
        self.view.backgroundColor = .white
        self.setGoToKoreaEntryButton()
        self.setStackViewSubviews()
        self.setbuttonStackSubviews()
    }
    
    private func setStackViewSubviews() {
        [expoTitle, posterImage, visitorsLabel, locationLabel, durationLabel, descriptionLabel, buttonStackView]
            .forEach { self.stackView.addArrangedSubview($0) }
    }
    
    private func setbuttonStackSubviews() {
        [leftFlagImage, goToKoreaEntryButton, rightFlagImage]
            .forEach { self.buttonStackView.addArrangedSubview($0) }
    }
    
    private func setTitleText(of expoInformation: ExpoInformation) {
        let headTitle = expoInformation.title.split(separator: "(")
        
        self.expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
    }
    
    private func setVisitorsLabel(of expoInformation: ExpoInformation) {
        guard let expoVisitors = expoInformation.visitors.formatNumber() else { return }
        self.visitorsLabel.text = ExpoNameSpace.howMany.name + expoVisitors + ExpoNameSpace.visit.name
    }
    
    private func setLocationLabel(of expoInformation: ExpoInformation) {
        self.locationLabel.text = ExpoNameSpace.where.name + expoInformation.location
    }
    
    private func setDurationLabel(of expoInformation: ExpoInformation) {
        self.durationLabel.text = ExpoNameSpace.howlong.name + expoInformation.duration
    }
    
    private func setDescriptionLabel(of expoInformation: ExpoInformation) {
        self.descriptionLabel.text = expoInformation.description
    }
    
    private func setStackView() {
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.alignment = .center
        self.stackView.spacing = 10
    }
    
    private func setButtonStackView() {
        self.buttonStackView.spacing = 10
        self.buttonStackView.axis = .horizontal
    }
    
    //MARK: - constraints
    
    private func setGoToKoreaEntryButton() {
        self.goToKoreaEntryButton.translatesAutoresizingMaskIntoConstraints = false
        self.goToKoreaEntryButton.addTarget(nil, action: #selector(didTappedButton), for: .touchUpInside)
    }
    
    private func setScrollViewConstraints() {
        self.view.addSubview(scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    private func setContentViewConstraints() {
        self.scrollView.addSubview(contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
    }
    
    private func setStackViewConstraints() {
        self.contentView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    private func setFlagImageConstraints() {
        self.leftFlagImage.translatesAutoresizingMaskIntoConstraints = false
        self.rightFlagImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leftFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     leftFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        NSLayoutConstraint.activate([rightFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     rightFlagImage.widthAnchor.constraint(equalToConstant: 50)])
    }
}
