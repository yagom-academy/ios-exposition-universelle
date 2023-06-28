//
//  MainView.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/28.
//

import UIKit

class MainView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints  = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .blue
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    convenience init() {
        self.init(frame: CGRectZero)
        
        configureUI()
        setUpContraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    private func setUpContraints() {
        setUpScrollViewConstraints()
        setUpContentViewConstraints()
    }
}

// MARK: - Constraints
extension MainView {
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 1)
        ])
        
        let contentViewHeightConstraints = contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: 1)
        contentViewHeightConstraints.priority = .init(1)
        contentViewHeightConstraints.isActive = true
    }
}
