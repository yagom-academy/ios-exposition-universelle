//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class PosterViewController: UIViewController {

    private let exposition: Exposition? = {
        let decoder = Decoder()
        return decoder.decodeExposition()
    }()
    
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메인"
   
        setScrollView()
        setStackView()
        setTitleLabel()
        setImageView()
        setInformationLabel()
        setDescriptionLabel()
        setChangeSceneButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setStackView() {
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 11
        stackView.alignment = .center
        stackView.distribution = .fill
    }
    
    func setTitleLabel() {
        guard var title = exposition?.title else { return }

        if let index = title.range(of: "(")?.lowerBound {
            title.insert(contentsOf: "\n", at: index)
        }

        let titleLabel = UILabel()
        
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 26)
        
        stackView.addArrangedSubview(titleLabel)
        
    }
    
    func setImageView() {
        let imageView = makeImageView(fileName: "poster")
        stackView.addArrangedSubview(imageView)
    }
    
    func setInformationLabel() {
        guard let visitors = exposition?.accumulatedVisitor,
              let location = exposition?.location,
              let duration = exposition?.duration else { return }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let formattedVisitor = numberFormatter.string(for: visitors) else { return }
        
        let visitorsStackView = makeSubStackView(subTitle: "방문객", contents: formattedVisitor + " 명")
        let locationStackView = makeSubStackView(subTitle: "개최지", contents: location)
        let durationStackView = makeSubStackView(subTitle: "개최 기간", contents: duration)
        
        stackView.addArrangedSubview(visitorsStackView)
        stackView.addArrangedSubview(locationStackView)
        stackView.addArrangedSubview(durationStackView)
    }
    
    func makeSubStackView(subTitle: String, contents: String) -> UIStackView {
        let subStackView = UIStackView()
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subTitle
        subTitleLabel.font = .systemFont(ofSize: 22)
        
        let contentsLabel = UILabel()
        contentsLabel.text = " : " + contents
        
        subStackView.axis = .horizontal
        subStackView.addArrangedSubview(subTitleLabel)
        subStackView.addArrangedSubview(contentsLabel)
        
        return subStackView
    }
    
    func setDescriptionLabel() {
        guard let description = exposition?.description else { return }
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = description
        descriptionLabel.textAlignment = .left
        
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setChangeSceneButton() {
        let button = UIButton()
  
        let text = NSAttributedString(string: "한국의 출품작 보러가기")
        
        button.setAttributedTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
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
    
    func makeImageView(fileName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: fileName)
        imageView.image = image
        
        return imageView
    }
    
    @objc func changeScene() {
        let exhibitItemView = ExhibitItemViewController()
        self.navigationController?.pushViewController(exhibitItemView, animated: true)
    }
}




// MARK: - Canvas
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = PosterViewController
    
    func makeUIViewController(context: Context) -> PosterViewController {
            return PosterViewController()
        }

    func updateUIViewController(_ uiViewController: PosterViewController, context: Context) {
    }
}
@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
