//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
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
        view.backgroundColor = .white
        
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

        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(posterImageView)
        verticalStackView.addArrangedSubview(configureDetailsStackView("방문객", formattedVisitors))
        verticalStackView.addArrangedSubview(configureDetailsStackView("개최지", entity.location))
        verticalStackView.addArrangedSubview(configureDetailsStackView("개최 기간", entity.duration))
        verticalStackView.addArrangedSubview(descriptionLabel)
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
}
