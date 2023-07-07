//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/29.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let contentImageView: UIImageView = {
        let contentImage = UIImageView()
        contentImage.contentMode = .scaleAspectFit
        return contentImage
    }()
    
    private let contentLabel = CommonLabel()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(_ expositionItem: ExpositionItem) {
        super.init(nibName: nil, bundle: nil)
        
        contentImageView.image = UIImage(named: expositionItem.imageName)
        contentLabel.text = expositionItem.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor(.systemBackground)
        configureUI()
        setUpConstraints()
    }
    
    private func configureUI() {
        [contentImageView, contentLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        contentView.addSubview(stackView)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
    }
    
    private func setUpConstraints() {
        setUpScrollViewConstraints()
        setUpContentViewConstraints()
        setUpStackViewConstraints()
        setUpImageViewConstraints()
    }
    
    private func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

// MARK: - Constraints
extension EntryDetailViewController {
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setUpContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 15),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])

        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: 1)
        contentViewHeightConstraint.priority = .init(1)
        contentViewHeightConstraint.isActive = true
    }
    
    private func setUpStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            contentImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            contentImageView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.75)
        ])
    }
}
