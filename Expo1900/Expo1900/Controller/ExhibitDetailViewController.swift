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
        configureInit()
    }
}

private extension ExhibitDetailViewController {
    func configureInit() {
        self.title = exhibit.name
        view.backgroundColor = .systemBackground
        
        configureDetailView()
    }
    
    func configureDetailView() {
        addSubviews()
        addArrangedSubview()
        configureDetatilStackView()
        configureItemImage()
        configureItemDescription()
        addConstraintsScrollerView()
        addConstraintsDetailView()
    }
    
    func addSubviews() {
        view.addSubview(detailScrollView)
        detailScrollView.addSubview(detailStackView)
    }
    
    func addArrangedSubview() {
        detailStackView.addArrangedSubview(itemImage)
        detailStackView.addArrangedSubview(itemDescription)
    }
    
    func configureDetatilStackView() {
        detailStackView.axis = .vertical
        detailStackView.alignment = .center
        detailStackView.spacing = 10
    }
    
    func configureItemImage() {
        itemImage.image = UIImage(named: exhibit.imageName)
        itemImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureItemDescription() {
        itemDescription.numberOfLines = 0
        itemDescription.text = exhibit.description
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addConstraintsScrollerView() {
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailScrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func addConstraintsDetailView() {
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: detailScrollView.topAnchor, constant: 20),
            detailStackView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor, constant: -20),
            detailStackView.centerXAnchor.constraint(equalTo: detailScrollView.centerXAnchor),
            detailStackView.widthAnchor.constraint(equalTo: detailScrollView.widthAnchor, constant: -40)
        ])
    }
}

