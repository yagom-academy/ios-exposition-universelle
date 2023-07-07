//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Max, Whales.

import UIKit

class ExpositionViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = SpacingNamespace.mainStackView
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: AssetNamespace.poster)
        image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.numberOfLines = .zero
        textLabel.font = .preferredFont(forTextStyle: .body)
        textLabel.adjustsFontForContentSizeCategory = true
        
        return textLabel
    }()
    
    private let visitorsStackView = ExpositionInformationStackView()
    private let locationStackView = ExpositionInformationStackView()
    private let durationStackView = ExpositionInformationStackView()
    private let buttonStackView = ChangeViewButtonStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = ViewControllerTitleNamespace.main
        
        do {
            let expositionEntity = try DecodingManager.shared.decodeJSON(fileName: AssetNamespace.expositionUniverselle, type: ExpositionEntity.self)
            
            configureMainView()
            configureLabelText(expositionEntity)
            addConstraints()
        } catch DecodingError.failedDecoding {
            ErrorLabel(DecodingError.failedDecoding.message, frame: view.frame).configureUI(view)
        } catch {
            ErrorLabel(DecodingError.unknown.message, frame: view.frame).configureUI(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = false
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = true
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc private func didTapButton() {
        navigationController?.pushViewController(ExpositionItemViewController(), animated: true)
    }
}

extension ExpositionViewController {
    private func configureMainView() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(posterImageView)
        mainStackView.addArrangedSubview(visitorsStackView)
        mainStackView.addArrangedSubview(locationStackView)
        mainStackView.addArrangedSubview(durationStackView)
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.changeViewButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func configureLabelText(_ expositionEntity: ExpositionEntity) {
        titleLabel.text = expositionEntity.title.addNewLineBeforeParentheses()
        descriptionLabel.text = expositionEntity.description
        
        visitorsStackView.subtitleLabel.text = LabelTextNamespace.visitors
        locationStackView.subtitleLabel.text = LabelTextNamespace.location
        durationStackView.subtitleLabel.text = LabelTextNamespace.duration
        
        let formattedVisitors = expositionEntity.visitors.formatToDecimal()
        
        visitorsStackView.dataLabel.text = formattedVisitors.addNumberOfPeople()
        locationStackView.dataLabel.text = expositionEntity.location
        durationStackView.dataLabel.text = expositionEntity.duration
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            mainStackView.topAnchor.constraint(
                equalTo: mainScrollView.topAnchor,
                constant: ConstraintsNamespace.stackViewFromScrollViewTop
            ),
            mainStackView.bottomAnchor.constraint(
                equalTo: mainScrollView.bottomAnchor,
                constant: ConstraintsNamespace.stackViewFromScrollViewBottom
            ),
            mainStackView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            mainStackView.widthAnchor.constraint(
                equalTo: mainScrollView.widthAnchor,
                constant: ConstraintsNamespace.stackViewFromScrollViewWidth
            ),
            
            buttonStackView.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            buttonStackView.widthAnchor.constraint(
                equalTo: mainStackView.widthAnchor,
                multiplier: MultiplierNamespace.buttonStackViewWidthToMainStackView
            )
        ])
    }
}
