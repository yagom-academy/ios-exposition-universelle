//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private var expoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var expoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var expoItemName: String?
    private var expoItemImage: String?
    private var expoItemDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        setUpView()
    }
    
    private func setUpView() {
        title = expoItemName
        expoDescriptionLabel.text = expoItemDescription
        expoDescriptionLabel.numberOfLines = 0
        if let expoItemImage = expoItemImage {
            expoImageView.image = UIImage(named: expoItemImage)
        }
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
    
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 10),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -10),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -20)
        ])
        
        contentStackView.addArrangedSubview(expoImageView)
        contentStackView.addArrangedSubview(expoDescriptionLabel)
        
        NSLayoutConstraint.activate([
            expoImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func receiveData(from cell: ExpoItem) {
        expoItemName = cell.name
        expoItemDescription = cell.description
        expoItemImage = cell.imageName
    }
}
