//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Max, Whales.

import UIKit

class ExpositionViewController: UIViewController {
    private var expositionEntity: ExpositionEntity?
    private var isSetUpEntity: Bool = false
    
    private let verticalStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let mainScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setUpEntity()
        configureUI()
    }

    private func setUpEntity() {
        guard let entity = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        let decorder = JSONDecoder()
        
        do {
            expositionEntity = try decorder.decode(ExpositionEntity.self, from: entity.data)
            isSetUpEntity = true
        } catch {
            isSetUpEntity = false
        }
    }
    
    private func configureUI() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(verticalStackView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainScrollView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 10),
            mainScrollView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -10),
            
            verticalStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            verticalStackView.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor)
        ])
        
        configureStackView()
    }
    
    private func configureStackView() {
        if isSetUpEntity {
            configureStackViewFromEntity()
        } else {
            let errorLabel = {
                let label = UILabel()
                label.text = "데이터를 불러오지 못했습니다."
                
                return label
            }()

            verticalStackView.addArrangedSubview(errorLabel)
        }
    }
    
    private func configureStackViewFromEntity() {
        guard let entity = expositionEntity else { return }
        
        let titleLabel = {
            let label = UILabel()
            label.text = entity.title
            label.textAlignment = .center
            
            return label
        }()

        let posterImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "poster")
            
            return image
        }()
        
        let descriptionLabel = {
            let textLabel = UILabel()
            textLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            textLabel.numberOfLines = 0
            textLabel.text = entity.description
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            
            return textLabel
        }()
        
        let formattedVisitors = "\(entity.visitors.formatToDecimal()) 명"
        let stackView = configureButtonStackView()

        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(posterImageView)
        verticalStackView.addArrangedSubview(configureDetailsStackView("방문객", formattedVisitors))
        verticalStackView.addArrangedSubview(configureDetailsStackView("개최지", entity.location))
        verticalStackView.addArrangedSubview(configureDetailsStackView("개최 기간", entity.duration))
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
    }
    
    private func configureDetailsStackView(_ subtitle: String, _ data: String) -> UIStackView {
        let detailsStackView = {
           let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.alignment = .center
            stackView.spacing = 10
            
            return stackView
        }()
        
        let subtitleLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = subtitle
            
            return label
        }()
        
        let dataLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = ": \(data)"
            
            return label
        }()
        
        detailsStackView.addArrangedSubview(subtitleLabel)
        detailsStackView.addArrangedSubview(dataLabel)
        
        return detailsStackView
    }
    
    private func configureButtonStackView() -> UIStackView {
        let buttonStackView = {
           let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        
        let leftFlagImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "flag")
            
            return imageView
        }()
        
        let rightFlagImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "flag")
            
            return imageView
        }()
        
        let changeViewButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("한국 출품작 보러가기", for: .normal)
            button.setTitleColor(UIColor.blue, for: .normal)
            
            return button
        }()
        
        buttonStackView.addArrangedSubview(leftFlagImageView)
        buttonStackView.addArrangedSubview(changeViewButton)
        buttonStackView.addArrangedSubview(rightFlagImageView)
        
        leftFlagImageView.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.2).isActive = true
        rightFlagImageView.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.2).isActive = true
        
        return buttonStackView
    }
}
