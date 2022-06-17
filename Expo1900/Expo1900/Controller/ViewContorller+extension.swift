//
//  ViewContorller+extension.swift
//  Expo1900
//
//  Created by 김동용 on 2022/06/16.
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
        
        
        //MARK: - mainViewConstraints
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
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
    
    }
    
}
