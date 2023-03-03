//
//  Expo1900 - MainViewController.swift
//  Created by 세홍, 송준, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController  {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let visitorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let pushExpoItemListViewButton: UIButton = {
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
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func checkValidDecodedData() {
        do {
            try decodedExposition.decodeData()
        } catch {
            presentAlert(title: DecodeError.title, message: error.localizedDescription)
        }
    }
    
    private func presentAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let string = NSLocalizedString("확인", comment: "확인버튼")
        let action = UIAlertAction(title: string, style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
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
            .makeNormalText(string: NameSpace.space
                            + NameSpace.colon
                            + NameSpace.space
                            + decodedExposition.exposition.visitors.convertDecimal()
                            + NameSpace.space
                            + NameSpace.person)
        
        locationLabel.attributedText = NSMutableAttributedString()
            .makeBigText(string: NameSpace.location)
            .makeNormalText(string: NameSpace.space
                            + NameSpace.colon
                            + NameSpace.space
                            + decodedExposition.exposition.location)
        
        durationLabel.attributedText = NSMutableAttributedString()
            .makeBigText(string: NameSpace.duration)
            .makeNormalText(string: NameSpace.space
                            + NameSpace.colon
                            + NameSpace.space
                            + decodedExposition.exposition.duration)
        
        descriptionLabel.text = decodedExposition.exposition.description
    }
}
