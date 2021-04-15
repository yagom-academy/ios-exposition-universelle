//
//  KoreanItemViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import UIKit

final class KoreanItemIntroductionViewController: UIViewController {
    
    private let itemIntroductionScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .white
        scrollview.bounces = true
        return scrollview
    }()
    
    private let itemIntroductionContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 500).isActive = true
        return imageView
    }()
    
    lazy var itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.lineBreakStrategy = .hangulWordPriority
        label.numberOfLines = 0
        return label
    }()
    
    lazy var contents = [itemImageView, itemDescriptionLabel]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItemIntroductionScrollView()
        setUpItemIntroductionStackView()
    }
    
    func setItemIntroductionContents(title: String, image: UIImage?, description: String) {
        navigationItem.title = title
        itemImageView.image = image
        itemDescriptionLabel.text = description
    }
    
    private func setUpItemIntroductionScrollView() {
        view.addSubview(itemIntroductionScrollView)
        addItemIntroductionScrollView()
    }
    
    private func addItemIntroductionScrollView() {
        NSLayoutConstraint.activate([
            itemIntroductionScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemIntroductionScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            itemIntroductionScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            itemIntroductionScrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    private func setUpItemIntroductionStackView() {
        itemIntroductionScrollView.addSubview(itemIntroductionContentStackView)
        addItemIntroductionStackViewConstraints()
        contents.forEach({ itemIntroductionContentStackView.addArrangedSubview($0) })
    }
    
    private func addItemIntroductionStackViewConstraints() {
        NSLayoutConstraint.activate([
            itemIntroductionContentStackView.leadingAnchor.constraint(equalTo: itemIntroductionScrollView.leadingAnchor),
            itemIntroductionContentStackView.topAnchor.constraint(equalTo: itemIntroductionScrollView.topAnchor),
            itemIntroductionContentStackView.widthAnchor.constraint(equalTo: itemIntroductionScrollView.widthAnchor, constant: -ViewConstant.scrollBarWidth),
            itemIntroductionContentStackView.bottomAnchor.constraint(equalTo: itemIntroductionScrollView.bottomAnchor)
        ])
    }
}
