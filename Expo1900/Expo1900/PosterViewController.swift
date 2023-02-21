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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        setStackView()
        setTitleLabel()
        setImageView()
        setInformationLabel()
        setDescriptionLabel()
    }
    
    func setStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
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
        let imageView = UIImageView()
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "poster")
        imageView.image = image
        
        stackView.addArrangedSubview(imageView)
    }
    
    func setInformationLabel() {
        guard let visitors = exposition?.visitors,
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
