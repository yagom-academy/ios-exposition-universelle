//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainPosterViewController: UIViewController {

    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureTitleLabel()
    }
    
    func configureScrollView() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func configureTitleLabel() {
        let label = UILabel()
        label.text = """
        파리 만국박람회 1900
        (L'Exposition de Paris 1900)
        """
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
    }

}

