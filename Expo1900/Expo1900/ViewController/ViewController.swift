//
//  ViewController.swift
//  ViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let posterImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "poster"))
        return image
    }()
    
    let visitorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftFlagImageView, entryButton, rightFlagImageView])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        return stackView
    }()
    
    let leftFlagImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "flag"))
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    let rightFlagImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "flag"))
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    
    let entryButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        return button
    }()
    
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exposition = decode()
        setLayout()
        setViewData()
    }
    
    private func decode() -> Exposition? {
        let jsonDecoder = JSONDecoder()
        let json = NSDataAsset(name: "exposition_universelle_1900")
        
        guard let result = try? jsonDecoder.decode(Exposition.self, from: json?.data ?? Data()) else {
            return nil
        }
        
        return result
    }
}

//MARK: - layout 설정
extension ViewController {
    private func setScrollView() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    private func setContentView() {
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setContentsChildView() {
        let layoutList: [UIView] = [
            titleLabel,
            posterImageView,
            visitorsLabel,
            locationLabel,
            durationLabel,
            descriptionLabel,
            stackView
        ]
        
        layoutList.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(element)
        }
    }
    
    private func setTitleLabelLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    private func setPosterImageViewLayout() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    private func setVisitorsLabelLayout() {
        NSLayoutConstraint.activate([
            visitorsLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            visitorsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            visitorsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setLocationLabelLayout() {
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setDurationLabelLayout() {
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            durationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setDescriptionLabelLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor),
        ])
    }
    
    private func setStackViewLayout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setLayout() {
        setScrollView()
        setContentView()
        setContentsChildView()
        
        setTitleLabelLayout()
        setPosterImageViewLayout()
        setVisitorsLabelLayout()
        setLocationLabelLayout()
        setDurationLabelLayout()
        setDescriptionLabelLayout()
        setStackViewLayout()
    }
}

//MARK: - Business Logic
extension ViewController {
    private func setViewData() {
        titleLabel.text = exposition?.titleData
        visitorsLabel.text = exposition?.visitorsData
        locationLabel.text = exposition?.locationData
        durationLabel.text = exposition?.durationData
        descriptionLabel.text = exposition?.description
    }
}
