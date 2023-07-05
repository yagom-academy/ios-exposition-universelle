//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionUniverselleViewController: UIViewController {
    private var expositionUniverselle: ExpositionUniverselle?
    private let delegate = UIApplication.shared.delegate as? AppDelegate
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let visitorsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let totalDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let posterImage: UIImageView = {
        let imageName: String = "poster"
        let image: UIImage? = UIImage(named: imageName)
        let imageView: UIImageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private let leftItemImage: UIImageView = {
        let imageName: String = "flag"
        let image: UIImage? = UIImage(named: imageName)
        let imageView: UIImageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private let rightItemImage: UIImageView = {
        let imageName: String = "flag"
        let image: UIImage? = UIImage(named: imageName)
        let imageView: UIImageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private lazy var expositionItemListButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(touchUpExpositionItemListButton), for: .touchUpInside)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        
        return button
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        
        return stackView
    }()
    
    private let expositionUniverselleScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpositionUniverselle()
        updateLabel()
        configureRootView()
        configureConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        delegate?.changeOrientation = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        delegate?.changeOrientation = false
    }
    
    private func decodeExpositionUniverselle() {
        do {
            expositionUniverselle = try JSONDecoder().decode(ExpositionUniverselle.self, from: JSONFile.exposition.description)
        } catch NSDataAssetError.invalidDataAsset {
            let alert: UIAlertController = AlertController().configureAlert(errorName: NSDataAssetError.invalidDataAsset.localizedDescription)
            present(alert, animated: true)
        } catch {
            let alert: UIAlertController = AlertController().configureAlert(errorName: error.localizedDescription)
            present(alert, animated: true)
        }
    }
    
    private func updateLabel() {
        navigationItem.title = "메인"
        titleLabel.text = expositionUniverselle?.titleForLabel
        visitorsLabel.text = expositionUniverselle?.visitorsForLabel
        locationLabel.text = expositionUniverselle?.locationForLabel
        durationLabel.text = expositionUniverselle?.durationForLabel
        totalDescriptionLabel.text = expositionUniverselle?.totalDescription
    }
    
    private func configureRootView() {
        addArrangedSubviews(to: buttonStackView, elements: [leftItemImage,
                                                            expositionItemListButton,
                                                            rightItemImage
                                                           ])
        addArrangedSubviews(to: contentStackView, elements: [titleLabel,
                                                             posterImage,
                                                             visitorsLabel,
                                                             locationLabel,
                                                             durationLabel,
                                                             totalDescriptionLabel,
                                                             buttonStackView])
        expositionUniverselleScrollView.addSubview(contentStackView)
        view.addSubview(expositionUniverselleScrollView)
        view.backgroundColor = .systemBackground
    }
    
    private func addArrangedSubviews(to superview: UIStackView, elements subviews: [UIView]) {
        subviews.forEach {
            superview.addArrangedSubview($0)
        }
    }
    
    private func configureConstraint() {
        configureItemImageConstraint()
        configureButtonStackViewConstraint()
        configureExpositionUniverselleScrollViewConstraint()
        configureContentStackViewConstraint()
    }
    
    private func configureItemImageConstraint() {
        NSLayoutConstraint.activate([
            leftItemImage.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.15),
            leftItemImage.heightAnchor.constraint(equalTo: leftItemImage.widthAnchor, multiplier: 0.6),
            rightItemImage.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.15),
            rightItemImage.heightAnchor.constraint(equalTo: rightItemImage.widthAnchor, multiplier: 0.6),
        ])
    }
    
    private func configureButtonStackViewConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func configureExpositionUniverselleScrollViewConstraint() {
        NSLayoutConstraint.activate([
            expositionUniverselleScrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.topAnchor),
            expositionUniverselleScrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            expositionUniverselleScrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            expositionUniverselleScrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureContentStackViewConstraint() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: expositionUniverselleScrollView.contentLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: expositionUniverselleScrollView.contentLayoutGuide.bottomAnchor, constant: -24),
            contentStackView.leadingAnchor.constraint(equalTo: expositionUniverselleScrollView.contentLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: expositionUniverselleScrollView.contentLayoutGuide.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: expositionUniverselleScrollView.frameLayoutGuide.widthAnchor)
        ])
    }
    
    @objc private func touchUpExpositionItemListButton() {
        let expositionItemListViewController: ExpositionItemListViewController = ExpositionItemListViewController()
        navigationController?.pushViewController(expositionItemListViewController, animated: true)
    }
}
