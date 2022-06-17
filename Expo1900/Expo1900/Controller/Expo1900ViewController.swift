//
//  KoreaItems.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/16.
//

import UIKit

class Expo1900ViewController: UIViewController {
    var expoData = ExpoData()

    let expo1900ScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let expo1900StackView: UIStackView = {
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
        label.numberOfLines = 2
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
    
    let expo1900SubStackView: UIStackView = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(expo1900ScrollView)
        
        let storeUIView = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel, expo1900SubStackView]
        storeUIView.forEach {self.expo1900StackView.addArrangedSubview($0)}
        
        let subStoreUIView = [leftFlagImageView, nextViewButton, rightFlagImageView]
        subStoreUIView.forEach {self.expo1900SubStackView.addArrangedSubview($0)}
        
        self.expo1900ScrollView.addSubview(expo1900StackView)
        
        setScrollViewConstraints()
        setStackViewConstraints()
        setSubStackViewConstraints()
        
        expoData.decodingJsonData()
        titleLabel.text = expoData.title
        visitorsLabel.text = expoData.visitors
        locationLabel.text = expoData.location
        durationLabel.text = expoData.duration
        descriptionLabel.text = expoData.description
    }

    private func setScrollViewConstraints() {
        expo1900ScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        expo1900ScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        expo1900ScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        expo1900ScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setStackViewConstraints() {
        expo1900StackView.topAnchor.constraint(equalTo: expo1900ScrollView.contentLayoutGuide.topAnchor).isActive = true
        expo1900StackView.bottomAnchor.constraint(equalTo: expo1900ScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        expo1900StackView.leadingAnchor.constraint(equalTo: expo1900ScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        expo1900StackView.widthAnchor.constraint(equalTo: expo1900ScrollView.frameLayoutGuide.widthAnchor).isActive = true
        expo1900StackView.trailingAnchor.constraint(equalTo: expo1900ScrollView.contentLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setSubStackViewConstraints() {
        expo1900SubStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        expo1900SubStackView.bottomAnchor.constraint(equalTo: expo1900StackView.bottomAnchor).isActive = true
        expo1900SubStackView.leadingAnchor.constraint(equalTo: expo1900StackView.leadingAnchor).isActive = true
        expo1900SubStackView.trailingAnchor.constraint(equalTo: expo1900StackView.trailingAnchor).isActive = true
        expo1900SubStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
    }
    
    @objc private func tappedNextViewButtonEvent() {
        let koreaItemsTableViewController = KoreaItemsTableViewController()
        self.navigationController?.pushViewController(koreaItemsTableViewController, animated: true)
    }
}


