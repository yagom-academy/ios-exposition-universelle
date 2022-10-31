//
//  Expo1900 - ExhibitionMainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExhibitionMainViewController: UIViewController {
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        
        return buttonStackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    lazy var visitorLabel = UILabel()
    lazy var locationLabel = UILabel()
    lazy var termLabel = UILabel()
    
    lazy var imageView: UIImageView = {
        let posterImage = UIImageView()
        
        posterImage.image = UIImage(named: ExpositionNameSpace.poster)
        posterImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        return posterImage
    }()
    
    lazy var descTextView: UITextView = {
        let textView = UITextView()

        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.adjustsFontForContentSizeCategory = true
        
        return textView
    }()
    
    lazy var leftFlagImageView: UIImageView = {
        let leftImage = UIImageView()
        
        leftImage.image = UIImage(named: ExpositionNameSpace.flag)
        
        return leftImage
    }()
    
    lazy var rightFlagImageView: UIImageView = {
        let rightImage = UIImageView()
        
        rightImage.image = UIImage(named: ExpositionNameSpace.flag)
        
        return rightImage
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        
        button.setTitle(ExpositionNameSpace.showingKoreanWorks, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        
        return button
    }()
    
    var expositionPoster: ExpositionPoster?
    private let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpJSONMainData()
        self.setUI()
    }
    
    func setUpJSONMainData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: ExpositionNameSpace.expoUniverselleKeys) else {
            return
        }
        
        do {
            expositionPoster = try jsonDecoder.decode(ExpositionPoster.self, from: dataAsset.data)
        } catch {
            print(ExpositionNameSpace.errorState + error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        delegate.changeOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
        delegate.changeOrientation = true
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        let exhibitionWorkListVC = ExhibitionWorkListViewController()
        
        self.navigationController?.pushViewController(exhibitionWorkListVC, animated: true)
    }
}

extension ExhibitionMainViewController {
    func setUI() {
        guard let expoInformation = expositionPoster else { return }

        self.setStackViewSubviews()
        self.setTitleText(of: expoInformation)
        self.setVisitorsLabel(of: expoInformation)
        self.setLocationLabel(of: expoInformation)
        self.setDurationLabel(of: expoInformation)
        self.setDescriptionTextView(of: expoInformation)
        self.setStackView()
        self.setButtonStackView()
        
        self.setDelegates()
        self.setConstraints()
    }

    private func setNavigation() {
        self.navigationController?.isNavigationBarHidden = true
    }

    private func setConstraints() {
        self.setScrollViewConstraints()
        self.setContentViewConstraints()
        self.setStackViewConstraints()
        self.setFlagImageConstraints()
    }

    private func setDelegates() {
        self.view.backgroundColor = .white
        self.setButtonConstraints()
        self.setStackViewSubviews()
        self.setbuttonStackSubviews()
    }

    private func setStackViewSubviews() {
        [titleLabel, imageView, visitorLabel, locationLabel, termLabel, descTextView, buttonStackView]
            .forEach { self.stackView.addArrangedSubview($0) }
    }

    private func setbuttonStackSubviews() {
        [leftFlagImageView, button, rightFlagImageView]
            .forEach { self.buttonStackView.addArrangedSubview($0) }
    }

    private func setTitleText(of expoInformation: ExpositionPoster) {
        let headTitle = expoInformation.title.split(separator: ExpositionNameSpace.spaceStandard)

        self.titleLabel.text = headTitle[0] + "\n(\(headTitle[1])"
    }

    private func setVisitorsLabel(of expoInformation: ExpositionPoster) {
        let visitorDetail: String
        
        do {
            visitorDetail = try expositionPoster?.visitors.formatNumber ?? ExpositionNameSpace.zero
        } catch {
            visitorDetail = ExpositionNameSpace.noneError
        }
        
        self.visitorLabel.text = ExpositionNameSpace.visitors + visitorDetail + ExpositionNameSpace.numberOfPeople

        let fullText = visitorLabel.text ?? ExpositionNameSpace.blank
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: ExpositionNameSpace.visitors)
        attribtuedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: range)
        visitorLabel.attributedText = attribtuedString
        
        visitorLabel.font = UIFont.preferredFont(forTextStyle: .body)
        visitorLabel.adjustsFontForContentSizeCategory = true
    }

    private func setLocationLabel(of expoInformation: ExpositionPoster) {
        self.locationLabel.text = ExpositionNameSpace.location + expoInformation.location
        
        let fullText = locationLabel.text ?? ExpositionNameSpace.blank
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: ExpositionNameSpace.location)
        attribtuedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: range)
        locationLabel.attributedText = attribtuedString
        
        locationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationLabel.adjustsFontForContentSizeCategory = true
    }

    private func setDurationLabel(of expoInformation: ExpositionPoster) {
        self.termLabel.text = ExpositionNameSpace.term + expoInformation.duration
        
        let fullText = termLabel.text ?? ExpositionNameSpace.blank
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: ExpositionNameSpace.term)
        attribtuedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: range)
        termLabel.attributedText = attribtuedString
        
        termLabel.font = UIFont.preferredFont(forTextStyle: .body)
        termLabel.adjustsFontForContentSizeCategory = true
    }

    private func setDescriptionTextView(of expoInformation: ExpositionPoster) {
        self.descTextView.text = expoInformation.description
    }
    
    private func setStackView() {
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.alignment = .center
        self.stackView.spacing = 10
    }

    private func setButtonStackView() {
        self.buttonStackView.spacing = 10
        self.buttonStackView.axis = .horizontal
    }
    
    private func setButtonConstraints() {
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.addTarget(nil, action: #selector(tappedButton(_:)), for: .touchUpInside)
    }
    
    private func setFlagImageConstraints() {
        self.leftFlagImageView.translatesAutoresizingMaskIntoConstraints = false
        self.rightFlagImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leftFlagImageView.heightAnchor.constraint(equalToConstant: 50),
                                     leftFlagImageView.widthAnchor.constraint(equalToConstant: 50)])
        NSLayoutConstraint.activate([rightFlagImageView.heightAnchor.constraint(equalToConstant: 50),
                                     rightFlagImageView.widthAnchor.constraint(equalToConstant: 50)])
    }
    
    private func setStackViewConstraints() {
        self.contentView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    private func setContentViewConstraints() {
        self.scrollView.addSubview(contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
    }
    
    private func setScrollViewConstraints() {
        self.view.addSubview(scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
