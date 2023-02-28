//
//  Expo1900 - MainViewController.swift
//  Created by 세홍, 송준, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
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
    
    private var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var visitorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var pushExpoItemListViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러 가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private func makeFlagImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    
    var decodedExposition: ExpositionDecoder = ExpositionDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodedExposition.decodeData()
        view.backgroundColor = .white
        setupSubView()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupSubView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(posterImageView)
        contentStackView.addArrangedSubview(visitorsLabel)
        contentStackView.addArrangedSubview(locationLabel)
        contentStackView.addArrangedSubview(durationLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addArrangedSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,
                                                  constant: 10),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                                                      constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor,
                                                    constant: -15)
        ])
        
        let leftFlagImage = makeFlagImage()
        let rightFlagImage = makeFlagImage()
        
        buttonStackView.addArrangedSubview(leftFlagImage)
        buttonStackView.addArrangedSubview(pushExpoItemListViewButton)
        buttonStackView.addArrangedSubview(rightFlagImage)
        
        NSLayoutConstraint.activate([
            leftFlagImage.widthAnchor.constraint(equalToConstant: 50),
            leftFlagImage.heightAnchor.constraint(equalToConstant: 50),
            rightFlagImage.widthAnchor.constraint(equalToConstant: 50),
            rightFlagImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpView() {
        titleLabel.text = decodedExposition.exposition.title.replacingOccurrences(of: NameSpace.bracket,
                                                                                  with: NameSpace.enterBracket)
        
        visitorsLabel.attributedText = NSMutableAttributedString()
            .makeBigText(string: NameSpace.visitor)
            .makeNormalText(string: NameSpace.colon
                            + decodedExposition.exposition.visitors.convertDecimal()
                            + NameSpace.person)
        
        locationLabel.attributedText = NSMutableAttributedString()
            .makeBigText(string: NameSpace.location)
            .makeNormalText(string: NameSpace.colon
                            + decodedExposition.exposition.location)
        
        durationLabel.attributedText = NSMutableAttributedString()
            .makeBigText(string: NameSpace.duration)
            .makeNormalText(string: NameSpace.colon
                            + decodedExposition.exposition.duration)
        
        descriptionLabel.text = decodedExposition.exposition.description
    }
}

extension NSMutableAttributedString {
    func makeBigText(string: String,
                     font: UIFont = .systemFont(ofSize: 20)) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
    
    func makeNormalText(string: String,
                     font: UIFont = .systemFont(ofSize: 17)) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
}
