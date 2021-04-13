//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private let expositionData: ExpositionUnivereselle1900
    
    private let mainScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .white
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.bounces = true
        return scrollview
    }()
    
    private let stackViewOfMainScrollView: UIStackView = {
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
    private lazy var visitorsLabel = ExpositionLabel(text: "방문객 : " + String(expositionData.visitors) + " 명", textStyle: .subheadline)
    private lazy var locationLabel = ExpositionLabel(text: "개최지 : " + expositionData.location, textStyle: .subheadline)
    private lazy var durationLabel = ExpositionLabel(text: "개최기간 : " + expositionData.duration, textStyle: .subheadline)
    private lazy var descriptionLabel = ExpositionLabel(text: expositionData.description, textStyle: .body)
    
    private let moveToKoreanItemsStackView: UIStackView = {
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
    
    private lazy var contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, moveToKoreanItemsStackView]
    
    required init(coder: NSCoder) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainScrollView()
        setStackViewOfMainScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setUpMainScrollView() {
        view.addSubview(mainScrollView)
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setStackViewOfMainScrollView() {
        mainScrollView.addSubview(stackViewOfMainScrollView)
        NSLayoutConstraint.activate([
            stackViewOfMainScrollView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            stackViewOfMainScrollView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            stackViewOfMainScrollView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            stackViewOfMainScrollView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor)
        ])
        contents.forEach({ stackViewOfMainScrollView.addArrangedSubview($0) })
    }
    
    @objc func touchUpMoveToKoreanItemsButton() {
        navigationController?.pushViewController(KoreanItemsRootViewController(coder: NSCoder()), animated: true)
    }
}
