//
//  MainStackView.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class MainStackView: UIStackView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.poster)
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return imageView
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    let visitorsStackView = ExpositionInformationStackView()
    let locationStackView = ExpositionInformationStackView()
    let durationStackView = ExpositionInformationStackView()
    let buttonStackView = ExhibitListChangeViewButtonStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInit()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureInit()
    }
}

private extension MainStackView {
    func configureInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .center
        self.spacing = 10
        
        addArrangedSubviews()
        configureVisitorsStackView()
        configureLocationStackView()
        configureDurationStackView()
    }
    
    func addArrangedSubviews() {
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(posterImageView)
        self.addArrangedSubview(visitorsStackView)
        self.addArrangedSubview(locationStackView)
        self.addArrangedSubview(durationStackView)
        self.addArrangedSubview(descriptionLabel)
        self.addArrangedSubview(buttonStackView)
    }
    
    func configureVisitorsStackView() {
        visitorsStackView.subtitleLabel.text = DataNamespace.visitors
    }
    
    func configureLocationStackView() {
        locationStackView.subtitleLabel.text = DataNamespace.location
    }
    
    func configureDurationStackView() {
        durationStackView.subtitleLabel.text = DataNamespace.duration

    }
}
