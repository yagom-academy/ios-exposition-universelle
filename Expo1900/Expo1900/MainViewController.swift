//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: VerticalScrollViewController {
    
    private var expositionData = ExpositionUnivereselle1900()
    private var titleLabel = ExpositionLabel()
    private var posterImageView = UIImageView()
    private var visitorsLabel = ExpositionLabel()
    private var locationLabel = ExpositionLabel()
    private var durationLabel = ExpositionLabel()
    private var descriptionLabel = ExpositionLabel()
    private var leftkoreanFlagImageView = UIImageView()
    private var rightkoreanFlagImageView = UIImageView()
    private var moveToKoreanItemsButton = UIButton()
    private var moveToKoreanItemsView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpositionData()
        setContentsOfMainView()
    }
    
    private func setExpositionData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        do {
            expositionData =  try JSONDecoder().decode(ExpositionUnivereselle1900.self, from: dataAsset.data)
        } catch {
            return
        }
    }
    
    private func setContentsOfMainView() {
        setLabelsOfMainView()
        setImageViewsOfMainView()
        setMoveToKoreanItemsView()
        lineUpContentsAtInterval(of: 10)
    }
    
    private func setLabelsOfMainView() {
        titleLabel = ExpositionLabel(text: expositionData.title, textStyle: .largeTitle)
        visitorsLabel = ExpositionLabel(text: "방문객 : " + String(expositionData.visitors) + " 명", textStyle: .subheadline)
        locationLabel = ExpositionLabel(text: "개최지 : " + expositionData.location, textStyle: .subheadline)
        durationLabel = ExpositionLabel(text: "개최기간 : " + expositionData.duration, textStyle: .subheadline)
        descriptionLabel = ExpositionLabel(text: expositionData.description, textStyle: .body)
    }
    
    private func setImageViewsOfMainView() {
        setPosterImageView()
    }
    
    private func setMoveToKoreanItemsView() {
        setMoveToKoreanItemsButton()
        setFlagImageView()
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView.addArrangedSubview(leftkoreanFlagImageView)
        stackView.addArrangedSubview(moveToKoreanItemsButton)
        stackView.addArrangedSubview(rightkoreanFlagImageView)
        moveToKoreanItemsView = stackView
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
    
    private func setPosterImageView() {
        let image = UIImage(named: "poster") ?? UIImage(systemName: "zzz")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        posterImageView = imageView
    }
    
    private func setFlagImageView() {
        leftkoreanFlagImageView = flagImageView()
        rightkoreanFlagImageView = flagImageView()
    }
    
    private func flagImageView() -> UIImageView {
        let image = UIImage(named: "flag") ?? UIImage(systemName: "zzz")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }
    
    private func setMoveToKoreanItemsButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        moveToKoreanItemsButton = button
    }
}
