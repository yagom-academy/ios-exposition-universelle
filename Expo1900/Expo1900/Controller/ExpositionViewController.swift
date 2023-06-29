//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Max, Whales.

import UIKit

class ExpositionViewController: UIViewController {
    private var expositionEntity: ExpositionEntity?
    private var isSetUpEntity: Bool = false
    
    private let mainScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let verticalStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = ViewControllerTitleNamespace.main
        
        setUpEntity()
        
        guard isSetUpEntity else {
            configureErrorLabel()
            return
        }
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setUpEntity() {
        guard let entity = NSDataAsset(name: AssetNamespace.expositionUniverselle) else {
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
        
        NSLayoutConstraint.activate([
            mainScrollView
                .topAnchor
                .constraint(equalTo: view.topAnchor),
            mainScrollView
                .bottomAnchor
                .constraint(equalTo: view.bottomAnchor),
            mainScrollView
                .leftAnchor
                .constraint(equalTo: view.leftAnchor),
            mainScrollView
                .rightAnchor
                .constraint(equalTo: view.rightAnchor),
            
            verticalStackView
                .topAnchor
                .constraint(equalTo: mainScrollView.topAnchor, constant: 20),
            verticalStackView
                .bottomAnchor
                .constraint(equalTo: mainScrollView.bottomAnchor, constant: -20),
            verticalStackView
                .centerXAnchor
                .constraint(equalTo: mainScrollView.centerXAnchor),
            verticalStackView
                .widthAnchor
                .constraint(equalTo: mainScrollView.widthAnchor, constant: -40)
        ])
        
        configureStackView()
    }
    
    private func configureErrorLabel() {
        let errorLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = LabelTextNameSpace.errorMessage
            
            return label
        }()
        
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel
                .centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            errorLabel
                .centerYAnchor
                .constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configureStackView() {
        guard let entity = expositionEntity else { return }
        
        let titleLabel = {
            let label = UILabel()
            label.text = entity.title.replacingOccurrences(of: "(", with: "\n(")
            label.font = .preferredFont(forTextStyle: .title1)
            label.numberOfLines = 0
            label.textAlignment = .center
            
            return label
        }()
        
        let posterImageView = {
            let image = UIImageView()
            image.image = UIImage(named: AssetNamespace.poster)
            
            return image
        }()
        
        let descriptionLabel = {
            let textLabel = UILabel()
            textLabel.text = entity.description
            textLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            textLabel.numberOfLines = 0
            
            return textLabel
        }()
        
        let formattedVisitors = "\(entity.visitors.formatToDecimal()) 명"
        let stackView = configureButtonStackView()
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(posterImageView)
        verticalStackView.addArrangedSubview(configureDetailsStackView(LabelTextNameSpace.visitors, formattedVisitors))
        verticalStackView.addArrangedSubview(configureDetailsStackView(LabelTextNameSpace.location, entity.location))
        verticalStackView.addArrangedSubview(configureDetailsStackView(LabelTextNameSpace.duration, entity.duration))
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView
                .leftAnchor
                .constraint(equalTo: verticalStackView.leftAnchor, constant: 40),
            stackView
                .rightAnchor
                .constraint(equalTo: verticalStackView.rightAnchor, constant: -40)
        ])
    }
    
    private func configureDetailsStackView(_ subtitle: String, _ data: String) -> UIStackView {
        let detailsStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 10
            
            return stackView
        }()
        
        let subtitleLabel = {
            let label = UILabel()
            label.text = subtitle
            label.font = .preferredFont(forTextStyle: .title3)
            
            return label
        }()
        
        let dataLabel = {
            let label = UILabel()
            label.text = ": \(data)"
            label.font = .preferredFont(forTextStyle: .body)
            
            return label
        }()
        
        detailsStackView.addArrangedSubview(subtitleLabel)
        detailsStackView.addArrangedSubview(dataLabel)
        
        return detailsStackView
    }
    
    private func configureButtonStackView() -> UIStackView {
        let buttonStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 30
            
            return stackView
        }()
        
        let leftFlagImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: AssetNamespace.flag)
            
            return imageView
        }()
        
        let rightFlagImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: AssetNamespace.flag)
            
            return imageView
        }()
        
        let changeViewButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(LabelTextNameSpace.buttonTitle, for: .normal)
            button.setTitleColor(UIColor.systemBlue, for: .normal)
            button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            
            return button
        }()
        
        buttonStackView.addArrangedSubview(leftFlagImageView)
        buttonStackView.addArrangedSubview(changeViewButton)
        buttonStackView.addArrangedSubview(rightFlagImageView)
        
        changeViewButton.setContentCompressionResistancePriority(.init(999), for: .horizontal)
        
        NSLayoutConstraint.activate([
            leftFlagImageView
                .heightAnchor
                .constraint(equalTo: leftFlagImageView.widthAnchor, multiplier: 0.65),
            rightFlagImageView
                .heightAnchor
                .constraint(equalTo: rightFlagImageView.widthAnchor, multiplier: 0.65),
            rightFlagImageView
                .widthAnchor
                .constraint(equalTo: leftFlagImageView.widthAnchor)
        ])
        
        return buttonStackView
    }
    
    @objc private func didTapButton() {
        show(ExpositionItemViewController(), sender: verticalStackView)
    }
}
