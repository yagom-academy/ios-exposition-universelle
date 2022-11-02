//
//  DetailViewController.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/20/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private enum Constant {
        static let imageViewTopConstraint: CGFloat = 20
        static let imageViewHeight: CGFloat = 150
        static let textViewTopConstraint: CGFloat = 10
        static let textViewLeadingConstraint: CGFloat = 10
        static let textViewTrailingConstraint: CGFloat = -10
    }
    
    private let koreaItem: KoreaItem?
    
    init(koreaItem: KoreaItem?) {
        self.koreaItem = koreaItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let itemImageView: UIImageView = {
        let itemImageView = UIImageView()
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        return itemImageView
    }()
    
    private let descriptionLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
        textLabel.textColor = UIColor.black
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let stackView: UIStackView = {
        let contentView = UIStackView()
        contentView.axis = .vertical
        contentView.alignment = .center
        contentView.distribution = .fill
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setupConstraint()
    }
}

extension DetailViewController {
    
    private func setUI(){
        setNavigationBar()
        setData()
        setViews()
    }
    
    private func setupConstraint(){
        setupScrollView()
        setupStackView()
        setupContentViewElement()
    }
    
    private func setNavigationBar() {
        self.title = koreaItem?.name
        let appearance = UINavigationBarAppearance()
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setData() {
        guard let item = koreaItem else { return }
        itemImageView.image = UIImage(named: item.imageName)
        descriptionLabel.text = item.description
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addSubview(itemImageView)
        stackView.addSubview(descriptionLabel)
    }
    
    private func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        let contentViewHeight = stackView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
    }
    
    private func setupContentViewElement() {
        NSLayoutConstraint.activate([
            itemImageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            itemImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: Constant.imageViewTopConstraint),
            itemImageView.heightAnchor.constraint(equalToConstant: Constant.imageViewHeight),
            descriptionLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: Constant.textViewTopConstraint),
            descriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Constant.textViewLeadingConstraint),
            descriptionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: Constant.textViewTrailingConstraint),
            descriptionLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
}
