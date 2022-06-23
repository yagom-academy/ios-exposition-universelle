//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/17.
//

import UIKit

final class KoreaItemDetailViewController: UIViewController {
    //MARK: - KoreaItemDetail Property

    private var koreaItems: KoreaItem?
    
    //MARK: - KoreaItemDetail View

    private let itemScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let itemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = DetailSetUp.stackViewSpacing
        return stackView
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = DetailSetUp.labelNumberOfLines
        label.lineBreakStrategy = .hangulWordPriority
        return label
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = koreaItems?.name

        setMainView()
        setViewConstraints()
        setKoreaItemData()
        addItemStackView()
    }

    //MARK: - Setting View Methods
    
    private func setMainView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(itemScrollView)
        self.itemScrollView.addSubview(itemStackView)
    }
    
    private func setViewConstraints() {
        setScrollViewConstraints()
        setStackViewConstraints()
        itemImageView.heightAnchor.constraint(lessThanOrEqualToConstant: DetailSetUp.itemImageViewMaxHeight).isActive = true
    }
    
    private func setScrollViewConstraints() {
        itemScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        itemScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        itemScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setStackViewConstraints() {
        itemStackView.topAnchor.constraint(equalTo: itemScrollView.contentLayoutGuide.topAnchor).isActive = true
        itemStackView.bottomAnchor.constraint(equalTo: itemScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        itemStackView.leadingAnchor.constraint(equalTo: itemScrollView.frameLayoutGuide.leadingAnchor, constant: DetailSetUp.itemStackViewLeadingWithFrameLayoutGuide).isActive = true
        itemStackView.trailingAnchor.constraint(equalTo: itemScrollView.frameLayoutGuide.trailingAnchor, constant: DetailSetUp.itemStackViewTrailingWithFrameLayoutGuide).isActive = true
    }
    
    private func setKoreaItemData() {
        itemImageView.image = koreaItems?.image
        descriptionLabel.text = koreaItems?.description
    }
        
    private func addItemStackView() {
        let stackViewItemsArray = [itemImageView, descriptionLabel]
        stackViewItemsArray.forEach { self.itemStackView.addArrangedSubview($0) }
    }
}

//MARK: - Extension Delegate

extension KoreaItemDetailViewController: KoreaItemSettable {
    func setData(_ item: KoreaItem) {
        koreaItems = item
    }
}

//MARK: - NameSpace for Setting View Detail Option

extension KoreaItemDetailViewController {
    private enum DetailSetUp {
        static let stackViewSpacing: CGFloat = 10
        static let itemImageViewMaxHeight: CGFloat = 200
        static let labelNumberOfLines = 0
        static let itemStackViewLeadingWithFrameLayoutGuide: CGFloat = 10
        static let itemStackViewTrailingWithFrameLayoutGuide: CGFloat = -10
    }
}
