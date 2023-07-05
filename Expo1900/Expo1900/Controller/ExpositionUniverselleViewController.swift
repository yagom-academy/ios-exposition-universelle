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
        
        return label
    }()
    
    private let visitorsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        
        return label
    }()
    
    private let totalDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        
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
        
        return button
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
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
        configureExpositionUniverselleScrollViewConstraint()
        configureContentStackViewConstraint()
    }
    
    private func configureExpositionUniverselleScrollViewConstraint() {
        NSLayoutConstraint.activate([
            expositionUniverselleScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            expositionUniverselleScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expositionUniverselleScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            expositionUniverselleScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureContentStackViewConstraint() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: expositionUniverselleScrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: expositionUniverselleScrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: expositionUniverselleScrollView.widthAnchor)
        ])
    }
    
    @objc private func touchUpExpositionItemListButton() {
        let expositionItemListViewController: ExpositionItemListViewController = ExpositionItemListViewController()
        navigationController?.pushViewController(expositionItemListViewController, animated: true)
    }
}
