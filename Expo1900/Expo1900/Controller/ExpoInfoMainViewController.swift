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
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.text = expoAssets?.title
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
    
    private lazy var numberOfVisitorsLabel = {
        let label = UILabel()
        label.text = "방문객 : \(String(expoAssets?.numberOfVisitors ?? 0).applyFormatter()) 명"
        return label
    }()
    
    private lazy var locationLabel = {
        let label = UILabel()
        label.text = "개최지 : \(self.expoAssets?.location ?? "")"
        return label
    }()
    
    private lazy var durationLabel = {
        let label = UILabel()
        label.text = "개최 기간 : \(self.expoAssets?.duration ?? "")"
        return label
    }()
    
    private lazy var descriptionLabel = {
        let label = UILabel()
        label.text = self.expoAssets?.description
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var nextViewButton = {
        let button = UIButton(type: .system)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.addTarget(self, action: #selector(didTapMoveToEntryTableVC), for: .touchUpInside)
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
    
    private lazy var buttonStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            leftFlagImageView,
            nextViewButton,
            rightFlagImageView
        ])
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var mainStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            posterImageView,
            numberOfVisitorsLabel,
            locationLabel,
            durationLabel,
            descriptionLabel,
            buttonStackView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpoInfo()
        configureUI()
        navigationItem.title = "메인"
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
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
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
    
    @objc private func didTapMoveToEntryTableVC() {
        navigationController?.pushViewController(EntryTableViewController(), animated: true)
    }
}
