//
//  MainStackView.swift
//  Expo1900
//
//  Created by Min Hyun on 2023/06/30.
//

import UIKit

class MainStackView: UIStackView {
    let titleLabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    let posterImageView = {
        let image = UIImageView()
        image.image = UIImage(named: AssetNamespace.poster)
        
        return image
    }()
    
    let descriptionLabel = {
        let textLabel = UILabel()
        textLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        textLabel.numberOfLines = 0
        
        return textLabel
    }()
    
    let visitorsStackView = ExpositionInformationStackView()
    let locationStackView = ExpositionInformationStackView()
    let durationStackView = ExpositionInformationStackView()
    let buttonStackView = ChangeViewButtonStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
        
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .center
        self.spacing = 10
        
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(posterImageView)
        self.addArrangedSubview(visitorsStackView)
        self.addArrangedSubview(locationStackView)
        self.addArrangedSubview(durationStackView)
        self.addArrangedSubview(descriptionLabel)
        self.addArrangedSubview(buttonStackView)
    }
}
