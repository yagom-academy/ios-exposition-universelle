//
//  Expo1900 - ViewController.swift
//  Created by 혜모리, Andrew on 2023/02/23.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoInfoMainViewController: UIViewController {
    var expoAssets: ExpositionInfo?
    
    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.text = expoAssets?.title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private let posterImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "poster")
        return imageView
    }()
    
    private lazy var numberOfVisitorsLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "방문객 : \(String(expoAssets?.numberOfVisitors ?? 0).applyFormatter()) 명"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, posterImageView, numberOfVisitorsLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeExpoInfo()
        configureUI()
    }
    
    func decodeExpoInfo() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            self.expoAssets = try jsonDecoder.decode(ExpositionInfo.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func configureUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}

