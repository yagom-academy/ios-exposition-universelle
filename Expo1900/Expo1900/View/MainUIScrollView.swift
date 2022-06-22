//
//  MainUIScrollView.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/15.
//

import UIKit

final class MainUIScrollView: UIView {
    
    private let mainScrollView = UIScrollView()
    
    private let expoInfo: Expo? = JSONDecoder.decodeJson(jsonName: "exposition_universelle_1900")
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let audienceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let venueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let periodLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let leftFlagImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "flag.png")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.5).isActive = true
        return imageView
    }()
    
    private let rightFlagImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "flag.png")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.5).isActive = true
        return imageView
    }()
    
    private let koreanEntryButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor( .systemBlue, for: .normal)
        return button
    }()
    
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainScrollView)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainScrollView.widthAnchor.constraint(equalTo: widthAnchor),
            mainScrollView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        mainStackViewConfigure()
        setupLabelConstraints()
        setupData()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupData() {
        guard let audienceNumber = expoInfo?.visitors,
              let formattedNumber = numberFormatter.string(from: audienceNumber as NSNumber),
              let location = expoInfo?.location,
              let duration = expoInfo?.duration else { return }
        
        mainTitleLabel.text = expoInfo?.title
        mainImageView.image = UIImage(named: "poster.png")
        audienceLabel.text = "방문객 : \(formattedNumber) 명"
        venueLabel.text = "개최지 : \(location)"
        periodLabel.text = "개최기간 : \(duration)"
        descriptionLabel.text = expoInfo?.description
    }
    
    private func mainStackViewConfigure() {
        [leftFlagImage, koreanEntryButton, rightFlagImage].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        [mainTitleLabel, mainImageView, audienceLabel, venueLabel, periodLabel, descriptionLabel, buttonStackView].forEach {
            mainStackView.addArrangedSubview($0)
        }
        
        backgroundColor = .white
        mainScrollView.addSubview(mainStackView)
    }
    
    private func setupLabelConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -50),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func addTargetKoreanEntryButton(target: Any?, action: Selector, for event: UIControl.Event) {
        koreanEntryButton.addTarget(target, action: action, for: event)
    }
}
