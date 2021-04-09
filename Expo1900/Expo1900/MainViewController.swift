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
    var goToKoreanItems: UIButton = {
        var button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        return button
    }()
    var koreanFlag: UIImageView = {
        var flagImage = UIImage(named: "flag")
        if flagImage == nil {
            flagImage = UIImage(systemName: "zzz")
        }
        let imageView = UIImageView(image: flagImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    lazy var flagStack: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        stackView.addSubview(koreanFlag)
        stackView.addSubview(goToKoreanItems)
        stackView.addSubview(koreanFlag)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineUpContentsAtInterval(of: 10)
    }
    
    private func lineUpContentsAtInterval(of interval: CGFloat) {
        let contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, flagStack]
        
        contents.enumerated().forEach({ (index, item) in
            item.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(item)
            item.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            item.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            
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
