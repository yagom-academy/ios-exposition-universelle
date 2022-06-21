//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let expositionDataManager = ExpositionDataManager()
    let numberFormatter = NumberFormatter()
    
    lazy var expositionModel: Exposition? = {
        return expositionDataManager.fetchData()
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = makeLabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.text = expositionModel?.title
        label.text = label.text?.replacingOccurrences(of: "(", with: "\n(")
        label.textAlignment = .center
        return label
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        return imageView
    }()
    
    lazy var visitorsStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var visitorsTitleLabel: UILabel = {
        let titleLabel = makeLabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "방문객 :"
        return titleLabel
    }()
    
    lazy var visitorsTextLabel: UILabel = {
        let textLabel = makeLabel()
        textLabel.text = "\(numberFormatter.string(for: expositionModel?.visitors) ?? "") 명"
        return textLabel
    }()
    
    lazy var locationStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var locationTitleLabel: UILabel = {
        let titleLabel = makeLabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "개최지 :"
        return titleLabel
    }()
    
    lazy var locationTextLabel: UILabel = {
        let textLabel = makeLabel()
        textLabel.text = "\(expositionModel?.location ?? "")"
        return textLabel
    }()
    
    lazy var durationStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var durationTitleLabel: UILabel = {
        let titleLabel = makeLabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "개최 기간 :"
        return titleLabel
    }()
    
    lazy var durationTextLabel: UILabel = {
        let textLabel = makeLabel()
        textLabel.text = "\(expositionModel?.duration ?? "")"
        return textLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = makeLabel()
        label.numberOfLines = 0
        label.text = expositionModel?.description ?? ""
        return label
    }()
    
    lazy var enterButtonStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var leftImageView: UIImageView = {
        return makeImageView(named: "flag", x: 60, y: 40)
    }()
    
    lazy var rightImageView: UIImageView = {
        return makeImageView(named: "flag", x: 60, y: 40)
    }()
    
    lazy var enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("한국의 출품작 보러가기", for: .normal)
        enterButton.setTitleColor(.systemBlue, for: .normal)
        enterButton.addTarget(self, action: #selector(enterButtonDidTapped(_:)), for: .touchUpInside)
        return enterButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "메인"
        numberFormatter.numberStyle = .decimal
        
        addAllSubview()
        designateScrollViewConstraints()
        designateStackViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func enterButtonDidTapped(_ sender: UIButton) {
        let itemTableViewController = ItemTableViewController()
        self.navigationController?.pushViewController(itemTableViewController, animated: true)
    }
}

private extension MainViewController {
    
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
        return label
    }
    
    func makeImageView(named: String, x: CGFloat, y: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: x).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: y).isActive = true
        imageView.image = UIImage(named: named)
        return imageView
    }
    
    func designateScrollViewConstraints() {
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func designateStackViewConstraints() {
        stackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addAllSubview() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(posterImageView)
        stackView.addArrangedSubview(visitorsStackView)
        stackView.addArrangedSubview(locationStackView)
        stackView.addArrangedSubview(durationStackView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(enterButtonStackView)
        
        visitorsStackView.addArrangedSubview(visitorsTitleLabel)
        visitorsStackView.addArrangedSubview(visitorsTextLabel)
        
        locationStackView.addArrangedSubview(locationTitleLabel)
        locationStackView.addArrangedSubview(locationTextLabel)
        
        durationStackView.addArrangedSubview(durationTitleLabel)
        durationStackView.addArrangedSubview(durationTextLabel)
        
        enterButtonStackView.addArrangedSubview(leftImageView)
        enterButtonStackView.addArrangedSubview(enterButton)
        enterButtonStackView.addArrangedSubview(rightImageView)
    }
}

