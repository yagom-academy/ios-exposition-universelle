//
//  Expo1900 - MainViewController.swift
//  Created by 세홍, 송준, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController  {
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
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
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
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var pushExpoItemListViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러 가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = "한국의 출품작 보러 가기"
        
        return button
    }()
    
    private func tapButton() {
        pushExpoItemListViewButton.addTarget(self, action: #selector(pushToExpoItemListViewController), for: .touchUpInside)
    }
    
    @objc func pushToExpoItemListViewController() {
        let expoItemListViewController = ExpoItemListViewController()
        self.navigationController?.pushViewController(expoItemListViewController, animated: true)
    }
    
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
        checkValidDecodedData()
        view.backgroundColor = .white
        setupSubView()
        setUpView()
        tapButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        AppDelegate.portraitOrientation = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        AppDelegate.portraitOrientation = false
    }
    
    private func checkValidDecodedData() {
        do {
            try decodedExposition.decodeData()
        } catch DecodeError.expositionDecodeError {
            let alertController = UIAlertController(title: "에러 발생",
                                                    message: "박람회 정보를 불러오지 못했습니다.",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            
            alertController.addAction(okAction)
            
            let rootViewController = UIApplication.shared.windows.first?.rootViewController
            rootViewController?.present(alertController, animated: true)
        } catch { }
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
