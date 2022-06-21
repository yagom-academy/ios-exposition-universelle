//
//  EntryDetailView.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class EntryDetailView: UIView {
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .equalSpacing
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 10
        stackview.backgroundColor = .white
        return stackview
    }()
    
    private let entryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
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

// - MARK: View Settings

private extension EntryDetailView {
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
            
            verticalStackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: -10),
            verticalStackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: entryImage.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    func setDefaultValue(with data: EntryEntity) {
        self.entryImage.image = data.image
        self.descriptionLabel.text = data.description
    }
}
