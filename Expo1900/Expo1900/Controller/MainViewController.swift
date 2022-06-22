//
//  Expo1900 - MainViewController.swift
//  Created by unchain, bard
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    var expoInformation: ExpoInformation?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let expoTitle: UILabel = {
        let expoTitle = UILabel()
        expoTitle.numberOfLines = 0
        expoTitle.textAlignment = .center
        return expoTitle
    }()
    
    let posterImage: UIImageView = {
        let posterImage = UIImageView()
        return posterImage
    }()
    
    let visitorsLabel: UILabel = {
        let visitorsLabel = UILabel()
        return visitorsLabel
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        return locationLabel
    }()
    
    let durationLabel: UILabel = {
        let durationLabel = UILabel()
        return durationLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        return descriptionLabel
    }()
    
    private let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        return buttonStackView
    }()
    
    private let leftFlagImage: UIImageView = {
        let leftFlagImage = UIImageView()
        leftFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
        
        NSLayoutConstraint.activate([leftFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     leftFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        return leftFlagImage
    }()
    
    private let rightFlagImage: UIImageView = {
        let rightFlagImage = UIImageView()
        rightFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
        
        NSLayoutConstraint.activate([rightFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     rightFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        return rightFlagImage
    }()
    
    private let goToKoreaEntryButton: UIButton = {
        let goToKoreaEntryButton = UIButton()
        goToKoreaEntryButton.translatesAutoresizingMaskIntoConstraints = false
        goToKoreaEntryButton.setTitle(ExpoNameSpace.koreaEntry.name, for: .normal)
        goToKoreaEntryButton.setTitleColor(.systemBlue, for: .normal)
        goToKoreaEntryButton.addTarget(nil, action: #selector(didTappedButton), for: .touchUpInside)
        return goToKoreaEntryButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setting()
        self.navigationItem.backButtonTitle = ExpoNameSpace.firstViewcontrollerTitle.name
        fetchExpoInformaion()
        updateUI()
    }
    
    @objc private func didTappedButton(_ sender: UIButton) {
        let entryListViewController = EntryListViewController()
        self.navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    //MARK: - fetchExpoInformaion
    func fetchExpoInformaion() {
        guard let expoInformation = JSONParser.fetch(fileName: ExpoNameSpace.expoInformationJSONFileName.name, parsedItems: expoInformation) else { return }
        self.expoInformation = expoInformation
    }
    
    private func setting() {
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
    
    private func setStackView() {
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

