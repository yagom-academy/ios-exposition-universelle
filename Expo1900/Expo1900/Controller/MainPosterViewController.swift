//
//  Expo1900 - ViewController.swift
//  Created by Harry, 레옹아범.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainPosterViewController: UIViewController {
    
    private var mainPoster: MainPoster? = nil
    private let customScrollView = CustomScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeJson()
        configureViews()
    }
    
    private func decodeJson() {
        let jsonDecoder = JSONDecoder()
        guard let data = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            mainPoster = try jsonDecoder.decode(MainPoster.self, from: data.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - View
extension MainPosterViewController {
    
    private func configureViews() {
        configureScrollView()
        configureTitleLabel()
        configureMainPosterImage()
        configureContentLabel(self.mainPoster?.visitorsText)
        configureContentLabel(self.mainPoster?.locationText)
        configureContentLabel(self.mainPoster?.durationText)
        configureTextView()
        configureFooter()
    }
    
    private func configureScrollView() {
        self.view.addSubview(customScrollView)
        
        NSLayoutConstraint.activate([
            customScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            customScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            customScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            customScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        let label = UILabel()
        
        label.text = self.mainPoster?.title
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.numberOfLines = 2

        self.customScrollView.addArrangeSubView(view: label)
    }
    
    private func configureMainPosterImage() {
        guard let image = UIImage(named: "poster") else { return }
        let imageView = UIImageView()
        
        imageView.image = image
        
        self.customScrollView.addArrangeSubView(view: imageView)
    }
    
    private func configureContentLabel(_ labelText: String?) {
        let label = UILabel()
        guard let text = labelText else { return }
        
        label.numberOfLines = 1
        
        let fontSize = UIFont.preferredFont(forTextStyle: .title3)
        let attributedText = NSMutableAttributedString(string: text)
        
        guard let index = text.firstIndex(of: ":") else { return }
        
        let substring = String(text.prefix(upTo: index))
        
        attributedText.addAttribute(.font, value: fontSize, range: (text as NSString).range(of: substring))
        label.attributedText = attributedText
        
        self.customScrollView.addArrangeSubView(view: label)
    }
    
    private func configureTextView() {
        let textView = UITextView()
        
        textView.font = .preferredFont(forTextStyle: .body)
        textView.text = self.mainPoster?.description
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        
        self.customScrollView.addArrangeSubView(view: textView)
    }
    
    private func configureFooter() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        let button = UIButton(type: .system)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        
        let leftImage = UIImageView(image: UIImage(named: "flag"))
        let height = leftImage.frame.height / 15
        let width = leftImage.frame.width / 15
        leftImage.widthAnchor.constraint(equalToConstant: width).isActive = true
        leftImage.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        let rightImage = UIImageView(image: UIImage(named: "flag"))
        rightImage.widthAnchor.constraint(equalToConstant: width).isActive = true
        rightImage.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        stackView.addArrangedSubview(leftImage)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(rightImage)
        
        self.customScrollView.addArrangeSubView(view: stackView)
    }
}
