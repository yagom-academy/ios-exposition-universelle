//
//  Expo1900 - ViewController.swift
//  Created by Harry, 레옹아범.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainPosterViewController: UIViewController {

    private let stackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private let scrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        scroll.showsVerticalScrollIndicator = false
        
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configureStackView()
        configureScrollView()
        
        configureTitleLabel()
        configureMainPosterImage()
        configureContentLabel()
        configureTextView()
    }
    
    private func configureScrollView() {
        self.view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        let label = UILabel()
        
        label.text = """
        파리 만국박람회 1900
        (L'Exposition de Paris 1900)
        """
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.numberOfLines = 2

        self.stackView.addArrangedSubview(label)
    }
    
    private func configureMainPosterImage() {
        guard let image = UIImage(named: "poster") else { return }
        let imageView = UIImageView()
        
        imageView.image = image
        
        self.stackView.addArrangedSubview(imageView)
    }
    
    private func configureContentLabel() {
        let label = UILabel()
        let text = "방문객 : 48,130,300 명"
        
        label.numberOfLines = 1
        
        let fontSize = UIFont.preferredFont(forTextStyle: .title3)
        let attributedText = NSMutableAttributedString(string: text)
        
        guard let index = text.firstIndex(of: ":") else { return }
        
        let substring = String(text.prefix(upTo: index))
        
        attributedText.addAttribute(.font, value: fontSize, range: (text as NSString).range(of: substring))
        label.attributedText = attributedText
        
        self.stackView.addArrangedSubview(label)
    }
    
    private func configureTextView() {
        let textView = UITextView()
        
        textView.font = .preferredFont(forTextStyle: .body)
        textView.text = "dsfadsf"
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        
        self.stackView.addArrangedSubview(textView)
    }
    
    private func configureStackView() {
        self.scrollView.addSubview(stackView)
        
        let scrollContentGuide = self.scrollView.contentLayoutGuide
        let scrollFrameGuide = self.scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            self.stackView.widthAnchor.constraint(equalTo: scrollFrameGuide.widthAnchor)
        ])
    }

}

