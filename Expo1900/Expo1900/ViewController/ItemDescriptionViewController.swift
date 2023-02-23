//
//  ItemDescriptionViewController.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/23.
//

import UIKit

class ItemDescriptionViewController: UIViewController {
    
    // MARK: - Property
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    private let item: ExhibitItem?
    
    // MARK: - Init Method
    init(_ indexPath: IndexPath) {
        item = ExhibitItem.items?[indexPath.row]
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View State Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
    }
    
    // MARK: - Instance Method
    private func initializeView() {
        view.backgroundColor = .white
        self.title = item?.name
        
        setScrollView()
        setStackView()
        setImageView()
        setDescriptionLabel()
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setStackView() {
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 12
    }
    
    private func setImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        guard let imageName = item?.imageName,
              let image = UIImage(named: imageName) else { return }
        
        imageView.image = image
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant:200).isActive = true
        
        stackView.addArrangedSubview(imageView)
    }
    
    private func setDescriptionLabel() {
        let descriptionLabel = UILabel()
        
        descriptionLabel.text = item?.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: FontSize.content)
        
        stackView.addArrangedSubview(descriptionLabel)
    }
}
