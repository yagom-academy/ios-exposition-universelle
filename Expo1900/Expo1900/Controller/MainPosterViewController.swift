//
//  MainPosterViewController.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/22.
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.title = "메인"
    }
    
    private func decodeJson() {
        let jsonDecoder = JSONDecoder()
        guard let data = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            mainPoster = try jsonDecoder.decode(MainPoster.self, from: data.data)
        } catch {
            let alert = AlertManager.decodingFailureAlert(error: .decodingError)
            present(alert, animated: false)
        }
    }
}

// MARK: - View
extension MainPosterViewController {
    
    private func configureViews() {
        configureScrollView()
        configureTitleLabel()
        configureMainPosterImage()
        configureInfoLabels()
        configureContentLabel()
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
        guard var titleText = self.mainPoster?.title,
              let index = titleText.firstIndex(of: "(") else { return }
        
        let label = UILabel()
        titleText.insert("\n", at: index)
        label.text = titleText
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        
        self.customScrollView.addArrangeSubView(view: label)
    }
    
    private func configureMainPosterImage() {
        guard let image = UIImage(named: "poster") else { return }
        let imageView = UIImageView()
        
        imageView.image = image
        
        self.customScrollView.addArrangeSubView(view: imageView)
    }
    
    func makeAttributedText(text: String, index: String.Index) -> NSMutableAttributedString {
        let bigFont = UIFont.preferredFont(forTextStyle: .title3)
        let generalFont = UIFont.preferredFont(forTextStyle: .body)
        
        let attributedText = NSMutableAttributedString(string: text)
        
        let textLineTitle = String(text.prefix(upTo: index))
        let textLineContent = String(text.suffix(from: index))
        
        attributedText.addAttribute(.font, value: bigFont, range: (text as NSString).range(of: textLineTitle))
        attributedText.addAttribute(.font, value: generalFont, range: (text as NSString).range(of: textLineContent))
        
        return attributedText
    }
    
    func configureInfoLabels() {
        let label = UILabel()
        
        label.numberOfLines = 3
        
        guard let firstLine = self.mainPoster?.visitorsText,
              let secondLine = self.mainPoster?.locationText,
              let thirdLine = self.mainPoster?.durationText else { return }

        let attributedText = NSMutableAttributedString()
        let lineBreakText = NSMutableAttributedString(string: "\n")
        
        [firstLine, secondLine, thirdLine].forEach { text in
            guard let index = text.firstIndex(of: ":") else { return }
            
            attributedText.append(makeAttributedText(text: text, index: index))
            
            if text != thirdLine {
                attributedText.append(lineBreakText)
            }
        }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        paragraphStyle.alignment = .center
        
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        label.adjustsFontForContentSizeCategory = true
        label.lineBreakMode = .byClipping
        label.adjustsFontSizeToFitWidth = true

        self.customScrollView.addArrangeSubView(view: label)
    }
    
    private func configureContentLabel() {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.text = self.mainPoster?.description
        label.font = .preferredFont(forTextStyle: .body)
        
        label.adjustsFontForContentSizeCategory = true
        label.lineBreakMode = .byCharWrapping
        
        self.customScrollView.addArrangeSubView(view: label)
    }
    
    private func configureFooter() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        let button = UIButton(type: .system)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.addTarget(self, action: #selector(tapExhibitionEntryButton), for: .touchUpInside)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        
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
    
    @objc private func tapExhibitionEntryButton() {
        self.navigationController?.pushViewController(ExhibitionEntryTableViewController(), animated: true)
    }
}
