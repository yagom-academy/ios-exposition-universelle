//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/17.
//

import UIKit

class DescriptionViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        addSubViews()
        setConstraints()
    }
    
    func addSubViews() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(view1)
        view1.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    //MARK: - setConstraints
    func setConstraints() {
        setScrollViewConstraints()
        setViewConstraints()
//        setImageViewConstraints()
//        setLabelConstraints()
        setStackViewConstraints()
    }
    
    //MARK: - setScrollViewConstraints
    func setScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    //MARK: - setViewConstraints
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            view1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            view1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            view1.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view1.topAnchor ),
            stackView.leadingAnchor.constraint(equalTo: self.view1.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.view1.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.view1.bottomAnchor)
        ])
    }
}
