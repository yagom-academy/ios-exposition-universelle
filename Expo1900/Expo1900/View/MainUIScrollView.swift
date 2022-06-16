//
//  MainUIScrollView.swift
//  Expo1900
//
//  Created by LeeChiheon on 2022/06/15.
//

import UIKit

class MainUIScrollView: UIScrollView {
    
    let contentView = UIView()
    
    lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    lazy var validJson = ViewController
    
    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = validJson?.title
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        guard let image = UIImage(named: "poster.png") else { return UIImageView() }
        imageView.image = image
        return imageView
    }()
    
    lazy var audienceLabel: UILabel = {
        let label = UILabel()
//        guard let audienceNumber = validJson?.visitors,
              let formattedNumber = numberFormatter.string(from: audienceNumber as NSNumber) else { return UILabel() }
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "방문객 : \(formattedNumber) 명"
        return label
    }()
    
    lazy var venueLabel: UILabel = {
        let label = UILabel()
        guard let location = validJson?.location else { return UILabel() }
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "개최지 : \(location)"
        return label
    }()
    
    lazy var periodLabel: UILabel = {
        let label = UILabel()
        guard let duration = validJson?.duration else { return UILabel() }
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "개최기간 : \(duration)"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = validJson?.description
        label.numberOfLines = 0
        return label
    }()
    
    let leftFlagImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "flag.png")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.5).isActive = true
        return imageView
    }()
    
    let rightFlagImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "flag.png")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.5).isActive = true
        return imageView
    }()
    
    let koreanEntryButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor( .systemBlue, for: .normal)
        return button
    }()
    
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftFlagImage, koreanEntryButton, rightFlagImage])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainTitleLabel, mainImage, audienceLabel, venueLabel, periodLabel, descriptionLabel, buttonStackView])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        mainStackViewConfigure()
        setupLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mainStackViewConfigure() {
        backgroundColor = .white
        addSubview(mainStackView)
    }
    
    func setupLabelConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -50),
            mainStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
