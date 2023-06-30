//
//  ExpositionItemViewController.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/29.
//

import UIKit

class ExpositionItemViewController: UIViewController {
    private var expositionItem: Item
    
    init(item: Item) {
        self.expositionItem = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var itemImage: UIImageView = {
        let imageName: String = expositionItem.imageName
        let image: UIImage? = UIImage(named: imageName)
        let imageView: UIImageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private lazy var totalDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = expositionItem.totalDescription
        label.numberOfLines = 0
        
        return label
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let expositionItemScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = expositionItem.name
        view.backgroundColor = .systemBackground
        contentStackView.addArrangedSubview(itemImage)
        contentStackView.addArrangedSubview(totalDescriptionLabel)
        expositionItemScrollView.addSubview(contentStackView)
        view.addSubview(expositionItemScrollView)
        configureConstraint()
    }
    
    private func configureConstraint() {
        configureExpositionItemScrollViewConstraint()
        configureContentStackViewConstraint()
    }
    
    private func configureExpositionItemScrollViewConstraint() {
        NSLayoutConstraint.activate([
            expositionItemScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            expositionItemScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expositionItemScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            expositionItemScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureContentStackViewConstraint() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: expositionItemScrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: expositionItemScrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: expositionItemScrollView.widthAnchor)
        ])
    }
}
