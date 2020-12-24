//
//  DetailExhibitScrollView.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class DetailExhibitScrollView: UIScrollView {
    
    //MARK: - Views
    private let exhibitInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private let exhibitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()
    
    private let exhibitDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .monospacedDigitSystemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        configureStackView()
        self.addSubview(exhibitInformationStackView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    public func configureExhibit(with exhibit: Exhibit?) {
        guard let exhibit = exhibit else {
            return
        }
        exhibitImageView.image = exhibit.exhibitImage
        exhibitDescriptionLabel.text = exhibit.description
    }
    
    //MARK: - Private
    private func setUpConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(exhibitInformationStackView.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor))
        constraints.append(exhibitInformationStackView.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor))
        constraints.append(exhibitInformationStackView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor))
        constraints.append(exhibitInformationStackView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor))
        constraints.append(exhibitInformationStackView.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureStackView() {
        exhibitInformationStackView.addArrangedSubview(exhibitImageView)
        exhibitInformationStackView.addArrangedSubview(exhibitDescriptionLabel)
    }
}
