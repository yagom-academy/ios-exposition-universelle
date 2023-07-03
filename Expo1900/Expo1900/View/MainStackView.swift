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
        return label
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.poster)
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let visitorsStackView = ExpositionInformationStackView()
    let locationStackView = ExpositionInformationStackView()
    let durationStackView = ExpositionInformationStackView()
    let buttonStackView = ExhibitListChangeViewButtonStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
}

private extension MainStackView {
    func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .center
        self.spacing = 10
        
        visitorsStackView.subtitleLabel.text = DataNamespace.visitors
        locationStackView.subtitleLabel.text = DataNamespace.location
        durationStackView.subtitleLabel.text = DataNamespace.duration
        
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(posterImageView)
        self.addArrangedSubview(visitorsStackView)
        self.addArrangedSubview(locationStackView)
        self.addArrangedSubview(durationStackView)
        self.addArrangedSubview(descriptionLabel)
        self.addArrangedSubview(buttonStackView)
    }
}
