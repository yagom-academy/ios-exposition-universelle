//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/17.
//

import UIKit

class ItemDetailViewController: UIViewController {
    var koreaItem: KoreaItem?
    
    let itemDetailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let itemDetailStackView: UIStackView = {
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
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = koreaItem?.name
        self.view.addSubview(itemDetailScrollView)
        self.itemDetailScrollView.addSubview(itemDetailStackView)
        
        setScrollViewConstraints()
        setStackViewConstraints()
        setStackViewConstraints()
        setKoreaItemData()
        addUIItemStackView()
    }
    
    private func setScrollViewConstraints() {
        itemDetailScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemDetailScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        itemDetailScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        itemDetailScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setStackViewConstraints() {
        itemDetailStackView.topAnchor.constraint(equalTo: itemDetailScrollView.contentLayoutGuide.topAnchor).isActive = true
        itemDetailStackView.bottomAnchor.constraint(equalTo: itemDetailScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        itemDetailStackView.leadingAnchor.constraint(equalTo: itemDetailScrollView.frameLayoutGuide.leadingAnchor, constant: 10).isActive = true
        itemDetailStackView.trailingAnchor.constraint(equalTo: itemDetailScrollView.frameLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setKoreaItemData() {
        itemImageView.image = koreaItem?.image
        descriptionLabel.text = koreaItem?.description
    }
    
    private func addUIItemStackView() {
        let storeUIView = [itemImageView, descriptionLabel]
        storeUIView.forEach { self.itemDetailStackView.addArrangedSubview($0) }
    }
}

extension ItemDetailViewController: SendDataDelegate {
    func sendItemData(item: KoreaItem) {
        koreaItem = item
    }
}
