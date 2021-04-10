//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: VerticalScrollViewController {
    
    var expositionData: ExpositionUnivereselle1900 {
        do {
            return try JSONDecoder().decode(ExpositionUnivereselle1900.self, from: NSDataAsset(name: "exposition_universelle_1900")!.data)
        } catch {
            return ExpositionUnivereselle1900()
        }
    }
    
    lazy var titleLabel = ExpositionLabel(text: expositionData.title, textStyle: .largeTitle)
    var posterImageView: UIImageView = {
        var posterImage = UIImage(named: "poster")
        if posterImage == nil {
            posterImage = UIImage(systemName: "zzz")
        }
        let imageView = UIImageView(image: posterImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    lazy var visitorsLabel = ExpositionLabel(text: "방문객 : " + String(expositionData.visitors) + " 명", textStyle: .subheadline)
    lazy var locationLabel = ExpositionLabel(text: "개최지 : " + expositionData.location, textStyle: .subheadline)
    lazy var durationLabel = ExpositionLabel(text: "개최기간 : " + expositionData.duration, textStyle: .subheadline)
    lazy var descriptionLabel = ExpositionLabel(text: expositionData.description, textStyle: .body)
    lazy var leftkoreanFlagImageView: UIImageView = {
        var flagImage = UIImage(named: "flag")
        if flagImage == nil {
            flagImage = UIImage(systemName: "zzz")
        }
        
        let imageView = UIImageView(image: flagImage)
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    lazy var rightkoreanFlagImageView: UIImageView = {
        var flagImage = UIImage(named: "flag")
        if flagImage == nil {
            flagImage = UIImage(systemName: "zzz")
        }
        
        let imageView = UIImageView(image: flagImage)
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    lazy var moveToKoreanItemsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    lazy var moveToKoreanItemsView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView.addArrangedSubview(leftkoreanFlagImageView)
        stackView.addArrangedSubview(moveToKoreanItemsButton)
        stackView.addArrangedSubview(rightkoreanFlagImageView)
        stackView.subviews.forEach({ $0.sizeToFit() })
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineUpContentsAtInterval(of: 10)
    }
    
    private func lineUpContentsAtInterval(of interval: CGFloat) {
        let contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, moveToKoreanItemsView]
        
        contents.enumerated().forEach({ (index, item) in
            scrollView.addSubview(item)
            item.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
}
