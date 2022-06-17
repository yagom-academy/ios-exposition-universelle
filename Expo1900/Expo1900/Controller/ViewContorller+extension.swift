//
//  ViewContorller+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//
import UIKit

extension ViewController {
    func setting() {
        self.view.backgroundColor = .white
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { return }
        guard let decodeData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { return }
        
        //MARK: - scrollViewConstraints
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollViewConstraints = [scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(scrollViewConstraints)
        
        //MARK: - contentView
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let contentViewConstranints = [contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                           contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                           contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                           contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                       contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)]
        NSLayoutConstraint.activate(contentViewConstranints)
        
        //MARK: - mainViewConstraints
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    
        //MARK: - titleLabel
        let headTitle = decodeData.title.split(separator: "(")
        let expoTitle = UILabel()
        
        expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
        expoTitle.numberOfLines = 0
        expoTitle.textAlignment = .center
        stackView.addArrangedSubview(expoTitle)
        
        //MARK: - image
        let posterImage = UIImageView()

        posterImage.image = UIImage(named: "poster")
        stackView.addArrangedSubview(posterImage)
    
        //MARK: - visitorsLabel
        let visitorsLabel = UILabel()
        
        visitorsLabel.text = "방문객 : \(decodeData.visitors.formatNumber() ?? "") 명"
        stackView.addArrangedSubview(visitorsLabel)
        
        //MARK: - locationLabel
        let locationLabel = UILabel()
        
        locationLabel.text = "개최지 : \(decodeData.location)"
        stackView.addArrangedSubview(locationLabel)
        
        //MARK: - durationLabel
        let durationLabel = UILabel()
        
        durationLabel.text = "개최기간 : \(decodeData.duration)"
        stackView.addArrangedSubview(durationLabel)
        
        //MARK: - descriptionLabel
        let descriptionLabel = UILabel()
        
        descriptionLabel.text = decodeData.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        stackView.addArrangedSubview(descriptionLabel)
        
        //MARK: - buttonStackView
        let buttonStackView = UIStackView()
        
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        stackView.addArrangedSubview(buttonStackView)
        
        //MARK: - leftFlagImage
        let leftFlagImage = UIImageView()
        leftFlagImage.image = UIImage(named: "flag")
        
        NSLayoutConstraint.activate([leftFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     leftFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        
        buttonStackView.addArrangedSubview(leftFlagImage)
        
        //MARK: - goToKoreaEntrybutton
        let goToKoreaEntrybutton = UIButton()
        goToKoreaEntrybutton.translatesAutoresizingMaskIntoConstraints = false
        goToKoreaEntrybutton.setTitle("한국의 출품작 보러가기", for: .normal)
        goToKoreaEntrybutton.setTitleColor(.systemBlue, for: .normal)
//        goToKoreaEntrybutton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        
//
        buttonStackView.addArrangedSubview(goToKoreaEntrybutton)
        
        //MARK: - didTappedButton
//        @objc func didTappedButton(_ sender: UIButton) {
//
//        }
        //MARK: - rightFlagImage
        let rightFlagImage = UIImageView()
        rightFlagImage.image = UIImage(named: "flag")
        
        NSLayoutConstraint.activate([rightFlagImage.heightAnchor.constraint(equalToConstant: 50),
                                     rightFlagImage.widthAnchor.constraint(equalToConstant: 50)])
        
        buttonStackView.addArrangedSubview(rightFlagImage)
    }
    
}
