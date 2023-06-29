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
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .blue
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpScrollViewConstraints()
        setUpContentViewConstraints()
    }
    
    private func configureUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        let contentViewHeight = contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: 1)
        contentViewHeight.priority = .init(1)
        contentViewHeight.isActive = true
    }
}
