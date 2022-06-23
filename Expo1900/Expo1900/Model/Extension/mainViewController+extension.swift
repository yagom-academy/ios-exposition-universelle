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
        
        self.setTitleText(of: expoInformation)
        self.setPosterImage()
        self.setVisitorsLabel(of: expoInformation)
        self.setLocationLabel(of: expoInformation)
        self.setDurationLabel(of: expoInformation)
        self.setDescriptionLabel(of: expoInformation)
        self.setStackView()
        self.setButtonStackView()
        self.setFlagImage()
    }
    
    func setting() {
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        self.setScrollView()
        self.setContentView()
        self.setStackViewConstraints()
        self.setFlagImageConstraints()
        self.setGoToKoreaEntryButton()
        self.setStackViewSubviews()
        self.setbuttonStackSubviews()
    }
    
    private func setStackViewSubviews() {
        self.stackView.addArrangedSubview(expoTitle)
        self.stackView.addArrangedSubview(posterImage)
        self.stackView.addArrangedSubview(visitorsLabel)
        self.stackView.addArrangedSubview(locationLabel)
        self.stackView.addArrangedSubview(durationLabel)
        self.stackView.addArrangedSubview(descriptionLabel)
        self.stackView.addArrangedSubview(buttonStackView)
    }
    
    private func setbuttonStackSubviews() {
        self.buttonStackView.addArrangedSubview(leftFlagImage)
        self.buttonStackView.addArrangedSubview(goToKoreaEntryButton)
        self.buttonStackView.addArrangedSubview(rightFlagImage)
    }
    
    private func setTitleText(of expoInformation: ExpoInformation) {
        let headTitle = expoInformation.title.split(separator: "(")
        
        self.expoTitle.numberOfLines = 0
        self.expoTitle.textAlignment = .center
        self.expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
    }
    
    private func setPosterImage() {
        self.posterImage.image = UIImage(named: ExpoNameSpace.expoPoster.name)
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
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.textAlignment = .left
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
    
    private func setFlagImage() {
        self.leftFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
        self.rightFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
    }
    
    //MARK: - constraints
    
    private func setGoToKoreaEntryButton() {
        self.goToKoreaEntryButton.translatesAutoresizingMaskIntoConstraints = false
        self.goToKoreaEntryButton.setTitle(ExpoNameSpace.koreaEntry.name, for: .normal)
        self.goToKoreaEntryButton.setTitleColor(.systemBlue, for: .normal)
        self.goToKoreaEntryButton.addTarget(nil, action: #selector(didTappedButton), for: .touchUpInside)
    }
    
    private func setScrollView() {
        self.view.addSubview(scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    private func setContentView() {
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
