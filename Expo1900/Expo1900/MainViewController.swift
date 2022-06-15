//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    var expositionDataManager = ExpositionDataManager()
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let result = expositionDataManager.getData() else { return }
        
        numberFormatter.numberStyle = .decimal
        
        navigationController?.isNavigationBarHidden = true
        
        let scrollView = makeScrollView()
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let stackView = makeVerticalStackView()
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        
        let title = makeLabel()
        stackView.addArrangedSubview(title)
        title.font = UIFont.systemFont(ofSize: 25)
        title.numberOfLines = 0
        title.text = result.title
        
        let posterView = UIImageView()
        let posterImage = UIImage(named: "poster")
        posterView.image = posterImage
        stackView.addArrangedSubview(posterView)
        
        let visitorsStack = makeHorizontalStackView()
        stackView.addArrangedSubview(visitorsStack)
        
        let visitorsTitle = makeLabel()
        visitorsStack.addArrangedSubview(visitorsTitle)
        visitorsTitle.font = UIFont.systemFont(ofSize: 20)
        visitorsTitle.text = "방문객 :"
        
        let visitorsText = makeLabel()
        visitorsStack.addArrangedSubview(visitorsText)
        visitorsText.text = "\(numberFormatter.string(for: result.visitors) ?? "") 명"
        
        let locationStack = makeHorizontalStackView()
        stackView.addArrangedSubview(locationStack)
        
        let locationTitle = makeLabel()
        locationStack.addArrangedSubview(locationTitle)
        locationTitle.font = UIFont.systemFont(ofSize: 20)
        locationTitle.text = "개최지 :"
        
        let locationText = makeLabel()
        locationStack.addArrangedSubview(locationText)
        locationText.text = "\(result.location)"
        
        let durationStack = makeHorizontalStackView()
        stackView.addArrangedSubview(durationStack)
        
        let durationTitle = makeLabel()
        durationStack.addArrangedSubview(durationTitle)
        durationTitle.font = UIFont.systemFont(ofSize: 20)
        durationTitle.text = "개최 기간 :"
        
        let durationText = makeLabel()
        durationStack.addArrangedSubview(durationText)
        durationText.text = "\(result.duration)"
        
        let description = makeLabel()
        stackView.addArrangedSubview(description)
        description.numberOfLines = 0
        description.text = result.description
    }
    
    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    func makeVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
    
    func makeHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "title"
        return label
    }
}

