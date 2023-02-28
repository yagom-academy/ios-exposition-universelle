//
//  Expo1900 - ViewController.swift
//  Created by 혜모리, Andrew on 2023/02/23.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoInfoMainViewController: UIViewController {
    private var expoAssets: ExpositionInfo?
    
    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private let posterImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        return imageView
    }()
    
    private let numberOfVisitorsLabel = {
        let label = UILabel()
        return label
    }()

    private let locationLabel = {
        let label = UILabel()
        return label
    }()
    
    private let durationLabel = {
        let label = UILabel()
        return label
    }()

    private let descriptionLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let nextViewButton = {
        let button = UIButton(type: .system)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        return button
    }()
    
    private let leftFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    private let rightFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpoInfo()
        configureLayout()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func decodeExpoInfo() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900")
        else { return }

        do {
            self.expoAssets = try jsonDecoder.decode(ExpositionInfo.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func configureLayout() {
        let mainStackView = createMainStackView(subStackView: createButtonStackView())
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "메인"
        titleLabel.text = expoAssets?.title
        numberOfVisitorsLabel.text = "방문객 : \(String(expoAssets?.numberOfVisitors ?? 0).applyNumberFormatter()) 명"
        numberOfVisitorsLabel.applyFont(targetString: "방문객")
        locationLabel.text = "개최지 : \(self.expoAssets?.location ?? "")"
        locationLabel.applyFont(targetString: "개최지")
        durationLabel.text = "개최 기간 : \(self.expoAssets?.duration ?? "")"
        durationLabel.applyFont(targetString: "개최 기간")
        descriptionLabel.text = self.expoAssets?.description
        nextViewButton.addTarget(self, action: #selector(didTapMoveToEntryTableVC), for: .touchUpInside)
    }
    
    private func createButtonStackView() -> UIStackView {
        let buttonStackView = {
            let stackView = UIStackView(arrangedSubviews: [leftFlagImageView,
                                                           nextViewButton,
                                                           rightFlagImageView])
            stackView.axis = .horizontal
            stackView.spacing = 20
            return stackView
        }()
        return buttonStackView
    }
    
    private func createMainStackView(subStackView: UIStackView) -> UIStackView {
        let mainStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                titleLabel,
                posterImageView,
                numberOfVisitorsLabel,
                locationLabel,
                durationLabel,
                descriptionLabel,
                subStackView
            ])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.spacing = 16
            stackView.distribution = .equalSpacing
            return stackView
        }()
        return mainStackView
    }
    
    @objc private func didTapMoveToEntryTableVC() {
        navigationController?.pushViewController(EntryTableViewController(), animated: true)
    }
}
