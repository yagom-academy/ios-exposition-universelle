//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private let expositionData: ExpositionUnivereselle1900
    
    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .white
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.bounces = true
        return scrollview
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
        setUpScrollView()
        setContentsVertically(intervalOf: 10)
    }
    
    private func setUpScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setContentsVertically(intervalOf interval: CGFloat) {
        contents.enumerated().forEach({ (index, item) in
            scrollView.addSubview(item)
            item.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            item.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
            
            if index == 0 {
                item.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            } else {
                item.topAnchor.constraint(equalTo: contents[index-1].bottomAnchor, constant: interval).isActive = true
            }
            
            if index == contents.count - 1 {
                item.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            }
        })
    }
    
    @objc func touchUpMoveToKoreanItemsButton() {
        let rootVc = KoreanItemsRootViewController()
        let navigationViewController = UINavigationController(rootViewController: rootVc)
        navigationViewController.modalPresentationStyle = .fullScreen
//        navigationController?.navigationBar.topItem?.title = "한국의 출품작"
        present(navigationViewController, animated: true, completion: nil)
    }
}
