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
    
    private let posterImageView = ExpositionImageView(imageName: "poster")
    
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
    
    private let moveToKoreanItemTableStackView: UIStackView = {
        let stackView = UIStackView()
        let stackViewHeight: CGFloat = 30
        
        let moveToKoreanItemTableViewButton: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("한국의 출품작 보러가기", for: .normal)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.addTarget(self, action: #selector(touchUpMoveToKoreanItemsButton), for: .touchUpInside)
            return button
        }()
        
        let leftkoreanFlagImageView = ExpositionImageView(imageName: "flag")
        let rightkoreanFlagImageView = ExpositionImageView(imageName: "flag")
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.heightAnchor.constraint(equalToConstant: stackViewHeight).isActive = true
        stackView.addArrangedSubview(leftkoreanFlagImageView)
        stackView.addArrangedSubview(moveToKoreanItemTableViewButton)
        stackView.addArrangedSubview(rightkoreanFlagImageView)
        return stackView
    }()
    
    private lazy var contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, moveToKoreanItemTableStackView]
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonFetcher.fetchJsonData(dataAssetName: "expositio_universelle_1900", completionHandler: fetchExpositionData(result:))
        view.backgroundColor = .white
        setExpoIntroductionViewTitle()
        setUpIntroductionScrollView()
        setUpIntroductionContentStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func fetchExpositionData(result: Result<ExpositionUnivereselle1900, JsonDecodingError>) {
        switch result {
        case .success(let expositionData):
            self.expositionData = expositionData
        case .failure(let jsonError):
            showAlert(failAlert(error: jsonError))
            self.expositionData = nil
        }
    }
    
    private func setExpoIntroductionViewTitle() {
        navigationItem.title = "메인"
    }
    
    private func setUpIntroductionScrollView() {
        view.addSubview(introductionScrollView)
        addIntroductionScrollViewConstraints()
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
