//
//  ExpositionItemViewController.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/29.
//

import UIKit

final class ExpositionItemViewController: UIViewController {
    private let expositionItem: Item
    
    private let itemImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let totalDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let expositionItemScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabelAndImage()
        configureRootView()
        configureConstraint()
    }
    
    init(item: Item) {
        self.expositionItem = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLabelAndImage() {
        navigationItem.title = expositionItem.name
        itemImage.image = UIImage(named: expositionItem.imageName)
        totalDescriptionLabel.text = expositionItem.totalDescription
    }
    
    private func configureRootView() {
        view.backgroundColor = .systemBackground
        contentStackView.addArrangedSubview(itemImage)
        contentStackView.addArrangedSubview(totalDescriptionLabel)
        expositionItemScrollView.addSubview(contentStackView)
        view.addSubview(expositionItemScrollView)
    }
    
    private func configureConstraint() {
        configureItemImageConstraint()
        configureExpositionItemScrollViewConstraint()
        configureContentStackViewConstraint()
    }
    
    private func configureItemImageConstraint() {
        NSLayoutConstraint.activate([
            itemImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            itemImage.heightAnchor.constraint(equalTo: itemImage.widthAnchor)
        ])
    }
    
    private func configureExpositionItemScrollViewConstraint() {
        NSLayoutConstraint.activate([
            expositionItemScrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.topAnchor),
            expositionItemScrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            expositionItemScrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            expositionItemScrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureContentStackViewConstraint() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: expositionItemScrollView.contentLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: expositionItemScrollView.contentLayoutGuide.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: expositionItemScrollView.contentLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: expositionItemScrollView.contentLayoutGuide.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: expositionItemScrollView.frameLayoutGuide.widthAnchor)
        ])
    }
}
