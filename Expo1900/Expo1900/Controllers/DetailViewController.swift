//
//  DetailViewController.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/20/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var koreaItem: KoreaItem?
    
    private let itemImageView: UIImageView = {
        let itemImageView = UIImageView()
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        return itemImageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = UIColor.black
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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

private extension DetailViewController {
    
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
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setData() {
        guard let item = koreaItem else { return }
        itemImageView.image = UIImage(named: item.imageName)
        textView.text = item.description
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addSubview(itemImageView)
        stackView.addSubview(textView)
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
            itemImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            itemImageView.heightAnchor.constraint(equalToConstant: 150),
            textView.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
}
