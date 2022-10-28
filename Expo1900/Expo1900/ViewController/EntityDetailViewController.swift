//  EntityDetailViewController.swift
//  EntityDetailViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

final class EntityDetailViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView = EntityDetailContentView()
    
    init(entity: Entity) {
        super.init(nibName: nil, bundle: nil)
        setImageView(imageName: entity.imageName)
        setDescriptionLabel(description: entity.description)
        navigationItem.title = entity.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUpLayout()
        setContentView()
    }
}

// MARK: - View Update 관련 메서드
private extension EntityDetailViewController {
    func setImageView(imageName: String) {
        contentView.setImageView(imageName: imageName)
    }
    
    func setDescriptionLabel(description: String) {
        contentView.setDescriptionLabel(description: description)
    }
}

// MARK: - Layout 설정
private extension EntityDetailViewController {
    func setUpLayout() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    func setContentView() {
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
