//
//  Expo1900 - MainViewController.swift
//  Created by unchain, bard
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let expoTitle: UILabel = {
        let expoTitle = UILabel()
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { return expoTitle }
        guard let decodeData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { return expoTitle }
        let headTitle = decodeData.title.split(separator: "(")
        expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
        expoTitle.numberOfLines = 0
        expoTitle.textAlignment = .center
        return expoTitle
    }()
    
    let posterImage: UIImageView = {
        let posterImage = UIImageView()
        posterImage.image = UIImage(named: "poster")
        return posterImage
    }()
    
    let visitorsLabel: UILabel = {
        let visitorsLabel = UILabel()
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { return visitorsLabel }
        guard let decodeData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { return visitorsLabel }
        visitorsLabel.text = "방문객 : \(decodeData.visitors.formatNumber() ?? "") 명"
        return visitorsLabel
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { return locationLabel }
        guard let decodeData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { return locationLabel }
        locationLabel.text = "개최지 : \(decodeData.location)"
        return locationLabel
    }()
    
    let durationLabel: UILabel = {
        let durationLabel = UILabel()
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { return durationLabel }
        guard let decodeData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { return durationLabel }
        durationLabel.text = "개최기간 : \(decodeData.duration)"
        return durationLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { return descriptionLabel }
        guard let decodeData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { return descriptionLabel }
        descriptionLabel.text = decodeData.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        return descriptionLabel
    }()
    
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        return buttonStackView
    }()
    
    let leftFlagImage: UIImageView = {
        let leftFlagImage = UIImageView()
        leftFlagImage.image = UIImage(named: "flag")
        
        NSLayoutConstraint.activate([leftFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     leftFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        return leftFlagImage
    }()
    
    let rightFlagImage: UIImageView = {
        let rightFlagImage = UIImageView()
        rightFlagImage.image = UIImage(named: "flag")
        
        NSLayoutConstraint.activate([rightFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     rightFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        return rightFlagImage
    }()
    
    let goToKoreaEntryButton: UIButton = {
        let goToKoreaEntryButton = UIButton()
        goToKoreaEntryButton.translatesAutoresizingMaskIntoConstraints = false
        goToKoreaEntryButton.setTitle("한국의 출품작 보러가기", for: .normal)
        goToKoreaEntryButton.setTitleColor(.systemBlue, for: .normal)
        goToKoreaEntryButton.addTarget(nil, action: #selector(didTappedButton), for: .touchUpInside)
        return goToKoreaEntryButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setting()
        self.navigationItem.backButtonTitle = "메인"
    }
    
    @objc func didTappedButton(_ sender: UIButton) {
        let entryListViewController = EntryListViewController()
        self.navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    func setting() {
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        setScrollView()
        setContentView()
        setStackView()
        
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
    
    func setScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollViewConstraints = [scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(scrollViewConstraints)
    }
    
    func setContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let contentViewConstranints = [contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                       contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                       contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                       contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                       contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)]
        NSLayoutConstraint.activate(contentViewConstranints)
    }
    
    func setStackView() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

