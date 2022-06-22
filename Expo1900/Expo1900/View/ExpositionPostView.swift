//
//  ExpositionPostView.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/16.
//

import UIKit

final class ExpositionPostView: UIView {
    private let verticalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .equalSpacing
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 10
        return stackview
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 5
        return stackview
    }()
    
    private var emptyStackView: UIStackView {
        get {
            let stackview = UIStackView()
            stackview.translatesAutoresizingMaskIntoConstraints = false
            return stackview
        }
        set {}
    }

    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let visitorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var flagImageView: UIImageView {
        get {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "flag")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
            return imageView
        }
        set {}
    }
    
    private let expositionEnterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    private var rootViewController: UIViewController?
    
    init(_ rootViewController: UIViewController, expositionPostEntity data: ExpositionPostEntity) {
        super.init(frame: .null)
        self.rootViewController = rootViewController
        
        addSubview(from: rootViewController.view)
        setDefaultValue(with: data)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// - MARK: View Settings

private extension ExpositionPostView {
    @objc func tappedExpositionEnterButton(_ sender: UIButton) {
        let entryTableViewController = EntryTableViewController()
        rootViewController?.navigationController?.pushViewController(entryTableViewController, animated: true)
    }
    
    func setDefaultValue(with data: ExpositionPostEntity) {
        titleLabel.text = data.manufacture(ExpositionPost.title)
        visitorLabel.text = data.manufacture(ExpositionPost.visitors)
        locationLabel.text = data.manufacture(ExpositionPost.location)
        durationLabel.text = data.manufacture(ExpositionPost.duration)
        descriptionLabel.text = data.manufacture(ExpositionPost.description)

        visitorLabel.setTitle(by: ":", for: .title3)
        locationLabel.setTitle(by: ":", for: .title3)
        durationLabel.setTitle(by: ":", for: .title3)
        
        expositionEnterButton.addTarget(self, action: #selector(tappedExpositionEnterButton(_:)), for: .touchUpInside)
    }
    
    func addSubview(from rootView: UIView) {
        rootView.addSubview(contentScrollView)
        
        self.contentScrollView.addSubview(verticalStackView)
        self.contentScrollView.addSubview(horizontalStackView)
        
        self.verticalStackView.addArrangedSubview(titleLabel)
        self.verticalStackView.addArrangedSubview(postImageView)
        self.verticalStackView.addArrangedSubview(visitorLabel)
        self.verticalStackView.addArrangedSubview(locationLabel)
        self.verticalStackView.addArrangedSubview(durationLabel)
        self.verticalStackView.addArrangedSubview(descriptionLabel)
        
        self.horizontalStackView.addArrangedSubview(emptyStackView)
        emptyStackView = UIStackView()
        
        self.horizontalStackView.addArrangedSubview(flagImageView)
        self.horizontalStackView.addArrangedSubview(expositionEnterButton)
        flagImageView = UIImageView()
        
        self.horizontalStackView.addArrangedSubview(flagImageView)
        self.horizontalStackView.addArrangedSubview(emptyStackView)
        setUpBaseUIConstraints(from: rootView)
    }
    
    func setUpBaseUIConstraints(from rootView: UIView) {
        horizontalStackView.insetsLayoutMarginsFromSafeArea = false
        contentScrollView.insetsLayoutMarginsFromSafeArea = false
        verticalStackView.insetsLayoutMarginsFromSafeArea = false
        contentScrollView.contentInsetAdjustmentBehavior = .never
        
        guard let safeArea = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.safeAreaInsets else {
            return
        }
        
        NSLayoutConstraint.activate([
            self.contentScrollView.topAnchor.constraint(equalTo: rootView.topAnchor),
            self.contentScrollView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            self.contentScrollView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
            self.contentScrollView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor),
            
            self.verticalStackView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            self.verticalStackView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            self.verticalStackView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: max(20.0, (safeArea.top))),
            self.verticalStackView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            
            self.descriptionLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 10),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -10),
            
            self.horizontalStackView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 10),
            self.horizontalStackView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            self.horizontalStackView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
         
            self.horizontalStackView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: -max(20.0, (safeArea.bottom))),
            self.horizontalStackView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
        ])
    }
}
