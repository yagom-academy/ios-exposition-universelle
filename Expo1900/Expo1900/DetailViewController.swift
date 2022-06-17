//
//  DetailViewController.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    var itemData: Entry?
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = itemData?.name
        
        setScrollView()
        setScrollViewLayout()
        setStackViewLayout()
        setImageViewLayout()
        updateComponent()
    }
    
    private func setScrollView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setScrollViewLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
    private func setImageViewLayout() {
        imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    }
    
    private func setStackViewLayout() {
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
    
    private func updateComponent() {
        let name = itemData!.imageName + "~universal@1x.png"
        imageView.image = UIImage(named: name)
        
        descriptionLabel.text = itemData!.longDescription
    }
}
