//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/17.
//

import UIKit

class ItemDetailViewController: UIViewController {
    //MARK: - ItemDetail Property

    var Item: KoreaItem?
    
    //MARK: -  ItemDetail View

    let itemScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let itemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = Item?.name
        self.view.addSubview(itemScrollView)
        self.itemScrollView.addSubview(itemStackView)
        
        setScrollViewConstraints()
        setStackViewConstraints()
        setKoreaItemData()
        addUIItemStackView()
    }

    //MARK: - Setting View Methods
    
    private func setScrollViewConstraints() {
        itemScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        itemScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        itemScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setStackViewConstraints() {
        itemStackView.topAnchor.constraint(equalTo: itemScrollView.contentLayoutGuide.topAnchor).isActive = true
        itemStackView.bottomAnchor.constraint(equalTo: itemScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        itemStackView.leadingAnchor.constraint(equalTo: itemScrollView.frameLayoutGuide.leadingAnchor, constant: 10).isActive = true
        itemStackView.trailingAnchor.constraint(equalTo: itemScrollView.frameLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setKoreaItemData() {
        itemImageView.image = Item?.image
        descriptionLabel.text = Item?.description
    }
        
    private func addUIItemStackView() {
        let storeUIView = [itemImageView, descriptionLabel]
        storeUIView.forEach { self.itemStackView.addArrangedSubview($0) }
    }
}

//MARK: - Extension Delegate

extension ItemDetailViewController: SendDataDelegate {
    func sendItemData(item: KoreaItem) {
        Item = item
    }
}
