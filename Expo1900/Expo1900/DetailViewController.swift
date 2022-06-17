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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = itemData?.name
        
        setScrollView()
        setScrollViewLayout()
        setImageViewLayout()
        setLabelLayout()
        updateComponent()
    }
    
    private func setScrollView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(descriptionLabel)
    }
    
    private func setScrollViewLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
    private func setImageViewLayout() {
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
    }
    
    private func setLabelLayout() {
        descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func updateComponent() {
        let name = itemData!.imageName + "~universal@1x.png"
        imageView.image = UIImage(named: name)
        
        descriptionLabel.text = itemData!.longDescription
    }
}
