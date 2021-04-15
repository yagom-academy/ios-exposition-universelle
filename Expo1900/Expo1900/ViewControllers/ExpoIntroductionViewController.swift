//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoIntroductionViewController: UIViewController {
    private let navigationTitle = "메인"
    private let expositionData: ExpositionUnivereselle1900
    
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
    
    private lazy var titleLabel = ExpositionLabel(text: expositionData.title, textStyle: .largeTitle)
    private let posterImageView = ExpositionImageView(imageName: "poster")
    private lazy var visitorsLabel = ExpositionLabel(text: ExpoAffix.Prefix.visitors + String(expositionData.visitors) + ExpoAffix.Suffix.visitors, textStyle: .subheadline)
    private lazy var locationLabel = ExpositionLabel(text: ExpoAffix.Prefix.location + expositionData.location, textStyle: .subheadline)
    private lazy var durationLabel = ExpositionLabel(text: ExpoAffix.Prefix.duration + expositionData.duration, textStyle: .subheadline)
    private lazy var descriptionLabel = ExpositionLabel(text: expositionData.description, textStyle: .body)
    
    private let moveToKoreanItemTableStackView: UIStackView = {
        let stackView = UIStackView()
        let moveToKoreanItemsButton: UIButton = {
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
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView.addArrangedSubview(leftkoreanFlagImageView)
        stackView.addArrangedSubview(moveToKoreanItemsButton)
        stackView.addArrangedSubview(rightkoreanFlagImageView)
        return stackView
    }()
    
    private lazy var contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, moveToKoreanItemTableStackView]
    
    init() {
        if let dataAsset = NSDataAsset(name: "exposition_universelle_1900") {
            do {
                expositionData =  try JSONDecoder().decode(ExpositionUnivereselle1900.self, from: dataAsset.data)
            } catch {
                expositionData = ExpositionUnivereselle1900()
            }
        } else {
            expositionData = ExpositionUnivereselle1900()
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        if let dataAsset = NSDataAsset(name: "exposition_universelle_1900") {
            do {
                expositionData =  try JSONDecoder().decode(ExpositionUnivereselle1900.self, from: dataAsset.data)
            } catch {
                expositionData = ExpositionUnivereselle1900()
            }
        } else {
            expositionData = ExpositionUnivereselle1900()
        }
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setExpoIntroductionViewTitle()
        setUpIntroductionScrollView()
        setUpIntroductionContentStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
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
        contents.forEach({ introductionContentStackView.addArrangedSubview($0) })
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
