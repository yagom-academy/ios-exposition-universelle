//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class PosterViewController: UIViewController {
    
    // MARK: - Property
    private let exposition: Exposition? = {
        let decoder = Decoder()
        return decoder.decodeExposition()
    }()
    
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    // MARK: - View State Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Instance Method
    private func initializeView() {
        view.backgroundColor = .white
        self.title = "메인"
        
        setScrollView()
        setStackView()
        setTitleLabel()
        setImageView()
        setInformationLabel()
        setDescriptionLabel()
        setChangeSceneButton()
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.setAutoLayout(equalTo: view,
                                 isNeededWidthAnchor: false,
                                 leadingConstant: 12,
                                 trailingConstant: -12)
    }
    
    private func setStackView() {
        scrollView.addSubview(stackView)
        stackView.setAutoLayout(equalTo: scrollView, isNeededWidthAnchor: true)
        
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.distribution = .fill
    }
    
    private func setTitleLabel() {
        guard var title = exposition?.title else { return }

        if let index = title.range(of: "(")?.lowerBound {
            title.insert(contentsOf: "\n", at: index)
        }

        let titleLabel = UILabel()
        
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: FontSize.title)
        
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setImageView() {
        let imageView = makeImageView(fileName: "poster")
        stackView.addArrangedSubview(imageView)
    }
    
    private func setInformationLabel() {
        guard let visitors = exposition?.accumulatedVisitor,
              let location = exposition?.location,
              let duration = exposition?.duration else { return }
        
        guard let formattedVisitor = formatVisitor(visitors) else { return }
        
        let visitorsStackView = makeSubStackView(subTitle: "방문객", contents: formattedVisitor + " 명")
        let locationStackView = makeSubStackView(subTitle: "개최지", contents: location)
        let durationStackView = makeSubStackView(subTitle: "개최 기간", contents: duration)
        
        stackView.addArrangedSubview(visitorsStackView)
        stackView.addArrangedSubview(locationStackView)
        stackView.addArrangedSubview(durationStackView)
    }
    
    private func formatVisitor(_ visitors: Int) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedVisitor = numberFormatter.string(for: visitors)
        
        return formattedVisitor
    }
    
    private func makeSubStackView(subTitle: String, contents: String) -> UIStackView {
        let subStackView = UIStackView()
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subTitle
        subTitleLabel.font = .systemFont(ofSize: FontSize.subTitle)
        
        let contentsLabel = UILabel()
        contentsLabel.text = " : " + contents
        
        subStackView.axis = .horizontal
        subStackView.addArrangedSubview(subTitleLabel)
        subStackView.addArrangedSubview(contentsLabel)
        
        return subStackView
    }
    
    private func setDescriptionLabel() {
        guard let description = exposition?.description else { return }
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = description
        descriptionLabel.textAlignment = .left
        
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setChangeSceneButton() {
        let button = UIButton()
  
        let text = NSAttributedString(string: "한국의 출품작 보러가기")
        
        button.setAttributedTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: FontSize.content)
        button.titleLabel?.textColor = .systemBlue
        button.addTarget(self, action: #selector(changeScene), for: .touchUpInside)
        
        let leftImageView = makeImageView(fileName: "flag")
        let rightImageView = makeImageView(fileName: "flag")
        leftImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        rightImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true

        let subStackView = UIStackView()
        subStackView.axis = .horizontal
        subStackView.distribution = .equalCentering
        subStackView.alignment = .center
        
        subStackView.addArrangedSubview(leftImageView)
        subStackView.addArrangedSubview(button)
        subStackView.addArrangedSubview(rightImageView)
        
        stackView.addArrangedSubview(subStackView)
    }
    
    private func makeImageView(fileName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: fileName)
        imageView.image = image
        
        return imageView
    }
    
    @objc private func changeScene() {
        let exhibitItemView = ExhibitItemViewController()
        self.navigationController?.pushViewController(exhibitItemView, animated: true)
    }
}
