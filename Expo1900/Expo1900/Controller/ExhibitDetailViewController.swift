//
//  ExhibitDetailViewController.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class ExhibitDetailViewController: UIViewController {
    private let exhibit: ExhibitionItem
    private let detailScrollView = UIScrollView()
    private let detailStackView = UIStackView()
    private let itemImage = UIImageView()
    private let itemDescription = UILabel()
    
    init(expositionItemDetail: ExhibitionItem) {
        self.exhibit = expositionItemDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = exhibit.name
        
        configureView()
        addConstraints()
    }
}

private extension ExhibitDetailViewController {
    func configureView() {
        view.addSubview(detailScrollView)
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        detailScrollView.addSubview(detailStackView)
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.axis = .vertical
        detailStackView.alignment = .center
        detailStackView.spacing = 10
        
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.image = UIImage(named: exhibit.imageName)
        
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        itemDescription.numberOfLines = 0
        itemDescription.text = exhibit.description
        
        detailStackView.addArrangedSubview(itemImage)
        detailStackView.addArrangedSubview(itemDescription)
    }
}

private extension ExhibitDetailViewController {
    func addConstraints() {
        NSLayoutConstraint.activate([
            detailScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            detailStackView.topAnchor.constraint(equalTo: detailScrollView.topAnchor, constant: 20),
            detailStackView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor, constant: -20),
            detailStackView.centerXAnchor.constraint(equalTo: detailScrollView.centerXAnchor),
            detailStackView.widthAnchor.constraint(equalTo: detailScrollView.widthAnchor, constant: -40)
        ])
    }
}
