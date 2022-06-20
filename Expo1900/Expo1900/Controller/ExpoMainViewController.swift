//
//  KoreaItems.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/16.
//

import UIKit

class ExpoMainViewController: UIViewController {
    //MARK: - Expo Main View
    
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let visitorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let leftFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nextViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
        button.addTarget(nil, action: #selector(tappedNextViewButtonEvent), for: .touchUpInside)
        return button
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "메인"
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(mainStackView)
        
        addUIItemStackView()
        setViewConstraints()
        setLabelText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Setting View Methods
    
    private func addUIItemStackView() {
        let storeUIView = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, subStackView]
        storeUIView.forEach {self.mainStackView.addArrangedSubview($0)}
        
        let subStoreUIView = [leftFlagImageView, nextViewButton, rightFlagImageView]
        subStoreUIView.forEach {self.subStackView.addArrangedSubview($0)}
    }
    
    private func setViewConstraints() {
        setScrollViewConstraints()
        setStackViewConstraints()
        setSubStackViewConstraints()
    }
    
    private func setScrollViewConstraints() {
        mainScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setStackViewConstraints() {
        mainStackView.topAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.frameLayoutGuide.leadingAnchor, constant: 10).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.frameLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setSubStackViewConstraints() {
        subStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        subStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        subStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor).isActive = true
        subStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
        subStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
    }
    
    private func setLabelText() {
        var expoData = ExpoData()
        expoData.decodingJsonData()
        titleLabel.text = expoData.title
        visitorsLabel.text = expoData.visitors
        locationLabel.text = expoData.location
        durationLabel.text = expoData.duration
        descriptionLabel.text = expoData.description
    }
    
    @objc private func tappedNextViewButtonEvent() {
        let koreaItemsTableViewController = KoreaItemTableViewController()
        self.navigationController?.pushViewController(koreaItemsTableViewController, animated: true)
    }
}
