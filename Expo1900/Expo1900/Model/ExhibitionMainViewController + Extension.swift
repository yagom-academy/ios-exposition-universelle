//
//  ExhibitionMainViewController + Extension.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/26.
//

import UIKit

extension ExhibitionMainViewController {
    func setUI() {
        guard let expoInformation = expositionPoster else { return }

        self.setStackViewSubviews()
        self.setTitleText(of: expoInformation)
        self.setVisitorsLabel(of: expoInformation)
        self.setLocationLabel(of: expoInformation)
        self.setDurationLabel(of: expoInformation)
        self.setDescriptionTextView(of: expoInformation)
        self.setStackView()
        self.setButtonStackView()
        
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
        self.setButtonConstraints()
        self.setStackViewSubviews()
        self.setbuttonStackSubviews()
    }

    private func setStackViewSubviews() {
        [titleLabel, imageView, visitorLabel, locationLabel, termLabel, descTextView, buttonStackView]
            .forEach { self.stackView.addArrangedSubview($0) }
    }

    private func setbuttonStackSubviews() {
        [leftFlagImageView, button, rightFlagImageView]
            .forEach { self.buttonStackView.addArrangedSubview($0) }
    }

    private func setTitleText(of expoInformation: ExpositionPoster) {
        let headTitle = expoInformation.title.split(separator: "(")

        self.titleLabel.text = headTitle[0] + "\n(\(headTitle[1])"
    }

    private func setVisitorsLabel(of expoInformation: ExpositionPoster) {
        let visitorDetail: String
        
        do {
            visitorDetail = "\(try expositionPoster?.visitors.formatNumber ?? "0") 명"
        } catch {
            visitorDetail = "확인 불가"
        }
        
        self.visitorLabel.text = "개최 기간 : " + visitorDetail
    }

    private func setLocationLabel(of expoInformation: ExpositionPoster) {
        self.locationLabel.text = "개최지 : " + expoInformation.location
    }

    private func setDurationLabel(of expoInformation: ExpositionPoster) {
        self.termLabel.text = "개최 기간 : " + expoInformation.duration
    }

    private func setDescriptionTextView(of expoInformation: ExpositionPoster) {
        self.descTextView.text = expoInformation.description
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
    
    private func setButtonConstraints() {
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.addTarget(nil, action: #selector(tappedButton(_:)), for: .touchUpInside)
    }
    
    private func setFlagImageConstraints() {
        self.leftFlagImageView.translatesAutoresizingMaskIntoConstraints = false
        self.rightFlagImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leftFlagImageView.heightAnchor.constraint(equalToConstant: 50),
                                     leftFlagImageView.widthAnchor.constraint(equalToConstant: 50)])
        NSLayoutConstraint.activate([rightFlagImageView.heightAnchor.constraint(equalToConstant: 50),
                                     rightFlagImageView.widthAnchor.constraint(equalToConstant: 50)])
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
    
    private func setContentViewConstraints() {
        self.scrollView.addSubview(contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
    }
    
    private func setScrollViewConstraints() {
        self.view.addSubview(scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

