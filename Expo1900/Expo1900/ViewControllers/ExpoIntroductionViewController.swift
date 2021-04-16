//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoIntroductionViewController: UIViewController {
    
    private let expoIntroductionNavigationTitle = "메인"
    private var expositionData: ExpositionUnivereselle1900?
    
    private let introductionScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .white
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.bounces = true
        return scrollview
    }()
    
    private let introductionContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    private var titleLabel: ExpositionLabel? {
        if let title = expositionData?.title {
            return ExpositionLabel(text: title, textStyle: .largeTitle)
        } else {
            return nil
        }
    }
    
    private let posterImageView = ExpositionImageView()
    
    private var visitorsLabel: ExpositionLabel? {
        if let visitors = expositionData?.visitors {
            return ExpositionLabel(text: ExpoAffix.Prefix.visitors + String(visitors) + ExpoAffix.Suffix.visitors,
                                   textStyle: .subheadline)
        } else {
            return nil
        }
    }
    
    private var locationLabel: ExpositionLabel? {
        if let location = expositionData?.location {
            return ExpositionLabel(text: ExpoAffix.Prefix.location + location, textStyle: .subheadline)
        } else {
            return nil
        }
    }
    
    private var durationLabel: ExpositionLabel? {
        if let duration = expositionData?.duration {
            return ExpositionLabel(text: ExpoAffix.Prefix.duration + duration, textStyle: .subheadline)
        } else {
            return nil
        }
    }
    
    private var descriptionLabel: ExpositionLabel? {
        if let description = expositionData?.description {
            return ExpositionLabel(text: description, textStyle: .body)
        } else {
            return nil
        }
    }
    
    private let moveToKoreanItemTableViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(touchUpMoveToKoreanItemsButton), for: .touchUpInside)
        return button
    }()
    
    private let leftKoreanFlagImageView = ExpositionImageView()
    private let rightKoreanFlagImageView = ExpositionImageView()
    
    private let moveToKoreanItemTableStackView: UIStackView = {
        let stackView = UIStackView()
        let stackViewHeight: CGFloat = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.heightAnchor.constraint(equalToConstant: stackViewHeight).isActive = true
        return stackView
    }()
    
    private lazy var contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, moveToKoreanItemTableStackView]
    
    var errorList = [ExpositionError]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpositionData()
        fetchImageData()
        setExpoIntroductionViewTitle()
        setUpMoveToKoreanItemTalbeViewStackView()
        setUpIntroductionScrollView()
        setUpIntroductionContentStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        showFailAlerts()
    }
    
    private func fetchExpositionData() {
        JsonFetcher.fetchJsonData(dataAssetName: "exposition_universelle_1900", completionHandler: fetchExpositionDataCompletionHandler(result:))
    }
    
    private func fetchImageData() {
        ImageFetcher.imageData(for: posterImageView, imageFileName: "poster", completionHandler: fetchImageDataCompletionHandler(imageView:result:))
        ImageFetcher.imageData(for: leftKoreanFlagImageView, imageFileName: "flag", completionHandler: fetchImageDataCompletionHandler(imageView:result:))
        ImageFetcher.imageData(for: rightKoreanFlagImageView, imageFileName: "flag", completionHandler: fetchImageDataCompletionHandler(imageView:result:))
    }
    
    private func fetchExpositionDataCompletionHandler(result: Result<ExpositionUnivereselle1900, ExpositionError>) {
        switch result {
        case .success(let expositionData):
            self.expositionData = expositionData
        case .failure(let jsonError):
            errorList.append(jsonError)
            self.expositionData = nil
        }
    }
    
    private func fetchImageDataCompletionHandler(imageView: UIImageView, result: Result<UIImage, ExpositionError>) {
        switch result {
        case .success(let image):
            imageView.image = image
        case .failure(let imageError):
            errorList.append(imageError)
            imageView.image = nil
        }
    }
    
    private func setExpoIntroductionViewTitle() {
        navigationItem.title = "메인"
    }
    
    private func setUpIntroductionScrollView() {
        view.addSubview(introductionScrollView)
        addIntroductionScrollViewConstraints()
    }
    
    private func setUpMoveToKoreanItemTalbeViewStackView() {
        moveToKoreanItemTableStackView.addArrangedSubview(leftKoreanFlagImageView)
        moveToKoreanItemTableStackView.addArrangedSubview(moveToKoreanItemTableViewButton)
        moveToKoreanItemTableStackView.addArrangedSubview(rightKoreanFlagImageView)
    }
    
    private func setUpIntroductionContentStackView() {
        introductionScrollView.addSubview(introductionContentStackView)
        addMainScrollViewConstraints()
        contents.forEach({
            if let content = $0 {
                introductionContentStackView.addArrangedSubview(content)
            }
        })
    }
    
    private func addIntroductionScrollViewConstraints() {
        NSLayoutConstraint.activate([
            introductionScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            introductionScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            introductionScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            introductionScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func addMainScrollViewConstraints() {
        NSLayoutConstraint.activate([
            introductionContentStackView.leadingAnchor.constraint(equalTo: introductionScrollView.leadingAnchor),
            introductionContentStackView.topAnchor.constraint(equalTo: introductionScrollView.topAnchor),
            introductionContentStackView.widthAnchor.constraint(equalTo: introductionScrollView.widthAnchor, constant: -ViewConstant.scrollBarWidth),
            introductionContentStackView.bottomAnchor.constraint(equalTo: introductionScrollView.bottomAnchor)
        ])
    }
    
    @objc func touchUpMoveToKoreanItemsButton() {
        navigationController?.pushViewController(KoreanItemTableViewController(), animated: true)
    }
}
