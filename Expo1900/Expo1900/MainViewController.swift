//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let expositionDataManager = ExpositionDataManager()
    let numberFormatter = NumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let result = expositionDataManager.getData() else { return }
        navigationItem.title = "메인"
        numberFormatter.numberStyle = .decimal
        
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
        title.text = title.text?.replacingOccurrences(of: "(", with: "\n(")
        title.textAlignment = .center
        
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
        
        let buttonStack = makeHorizontalStackView()
        stackView.addArrangedSubview(buttonStack)
       
        let button = makeButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        let leftImageView = makeImageView(named: "flag", x: 60, y: 40)
        let rightImageView = makeImageView(named: "flag", x: 60, y: 40)
        
        buttonStack.addArrangedSubview(leftImageView)
        buttonStack.addArrangedSubview(button)
        buttonStack.addArrangedSubview(rightImageView)
        
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func buttonDidTapped(_ sender: UIButton) {
        let itemTableViewController = ItemTableViewController.instantiate(bundle: nil, identifier: "ItemView")
        self.navigationController?.pushViewController(itemTableViewController, animated: true)
    }
}

private extension MainViewController {
    
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
    
    func makeButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeImageView(named: String, x: CGFloat, y: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: x).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: y).isActive = true
        imageView.image = UIImage(named: named)
        return imageView
    }
    
    func scrollViewAutoLayout() {
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func stackViewAutoLayout() {
        stackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
    }
}

