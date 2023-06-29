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
        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .blue
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let contentImage: UIImageView = {
        let contentImage = UIImageView()
        contentImage.image = UIImage(named: "poster")
        return contentImage
    }()
    
    private let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.backgroundColor = .brown
        return contentLabel
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .purple
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpConstraints()
    }
    
    private func configureUI() {
        [contentImage, contentLabel].forEach {
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
    }
}

// MARK: - Constraints
extension EntryDetailViewController {
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setUpContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
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
}
