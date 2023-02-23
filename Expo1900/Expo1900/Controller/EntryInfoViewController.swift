//
//  EntryInfoViewController.swift
//  Expo1900
//
//  Created by 혜모리, Andrew on 2023/02/23.
//

import UIKit

class EntryInfoViewController: UIViewController {
    var entry: Entry
    
    init(entry: Entry) {
        self.entry = entry
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var entryImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: entry.imageName)
        return imageView
    }()
    
    private lazy var entryDescriptionLabel = {
        let label = UILabel()
        label.text = entry.description
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
        
    private lazy var mainStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryImageView, entryDescriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = entry.name
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}
