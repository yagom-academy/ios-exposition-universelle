//
//  DescriptionViewController+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

import UIKit

extension DescriptionViewController {
    func setUI() {
        self.setDescriptionLabel()
        self.setStackView()
    }
    
    func setDescriptionLabel() {
        self.descriptionLabel.numberOfLines = 0
    }
    
    func setStackView() {
        self.stackView.axis = .vertical
        self.stackView.alignment = .center
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 10
    }
    
    func addSubViews() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentsView)
        self.contentsView.addSubview(stackView)
        self.stackView.addArrangedSubview(imageView)
        self.stackView.addArrangedSubview(descriptionLabel)
    }
    
    //MARK: - setConstraints
    func setConstraints() {
        self.setScrollViewConstraints()
        self.setViewConstraints()
        self.setStackViewConstraints()
    }
    
    //MARK: - setScrollViewConstraints
    func setScrollViewConstraints() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    //MARK: - setViewConstraints
    func setViewConstraints() {
        self.contentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setStackViewConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.contentsView.topAnchor ),
            stackView.leadingAnchor.constraint(equalTo: self.contentsView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.contentsView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.contentsView.bottomAnchor)
        ])
    }
}
