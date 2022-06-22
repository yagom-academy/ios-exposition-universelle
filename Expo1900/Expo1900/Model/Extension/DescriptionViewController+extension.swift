//
//  DescriptionViewController+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

import UIKit

extension DescriptionViewController {
    func setUI() {
        setDescriptionLabel()
        setStackView()
    }
    
    func setDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
    }
    
    func setStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
    }
    
    func addSubViews() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentsView)
        contentsView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    //MARK: - setConstraints
    func setConstraints() {
        setScrollViewConstraints()
        setViewConstraints()
        setStackViewConstraints()
    }
    
    //MARK: - setScrollViewConstraints
    func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    //MARK: - setViewConstraints
    func setViewConstraints() {
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.contentsView.topAnchor ),
            stackView.leadingAnchor.constraint(equalTo: self.contentsView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.contentsView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.contentsView.bottomAnchor)
        ])
    }
}
