//
//  ExpositionDetailView.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class ExpositionDetailView: UIView {
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 10
        stackview.backgroundColor = .white
        return stackview
    }()
    
    private let entryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    init(_ rootView: UIView ,data: EntryEntity) {
        super.init(frame: .null)
        
        addSubview(from: rootView)
        setDefaultValue(with: data)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ExpositionDetailView {
    func addSubview(from rootView: UIView) {
        rootView.addSubview(contentScrollView)
        contentScrollView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(entryImage)
        verticalStackView.addArrangedSubview(descriptionLabel)
        setUpUIConstraints(from: rootView)
    }
    
    func setUpUIConstraints(from rootView: UIView) {
        let contentLayoutGuide = contentScrollView.contentLayoutGuide
        let frameLayoutGuide = contentScrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            contentScrollView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            contentScrollView.topAnchor.constraint(equalTo: rootView.topAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor),
            
            entryImage.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 20),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 800),
            verticalStackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
        ])
    }
    
    func setDefaultValue(with data: EntryEntity) {
        self.entryImage.image = data.image
        self.descriptionLabel.text = data.description
    }
}
