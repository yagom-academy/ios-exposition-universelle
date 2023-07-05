//
//  ExpositionInformationStackView.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/30.
//

import UIKit

class ExpositionInformationStackView: UIStackView {
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = .zero
        
        return label
    }()
    
    let colonLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = LabelTextNamespace.colon
        
        return label
    }()
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = .zero
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.axis = .horizontal
        self.alignment = .center
        self.spacing = SpacingNamespace.expositionInformationStackView
        self.addArrangedSubview(subtitleLabel)
        self.addArrangedSubview(colonLabel)
        self.addArrangedSubview(dataLabel)
        
        subtitleLabel.setContentHuggingPriority(.required, for: .horizontal)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        dataLabel.setContentHuggingPriority(.required, for: .horizontal)
        dataLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        colonLabel.setContentHuggingPriority(.required, for: .horizontal)
        colonLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
