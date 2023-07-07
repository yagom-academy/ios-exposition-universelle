//
//  ExpositionInformationStackView.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class ExpositionInformationStackView: UIStackView {
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    let colonLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.text = DataNamespace.colon
        label.adjustsFontForContentSizeCategory = true

        return label
    }()
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureInit()
    }
}

private extension ExpositionInformationStackView {
    func configureInit() {
        self.axis = .horizontal
        self.alignment = .center
        self.spacing = 10
        
        addArrangedSubviews()
        addConstraints(for: subtitleLabel)
        addConstraints(for: dataLabel)
        addConstraints(for: colonLabel)
    }
    
    func addArrangedSubviews() {
        self.addArrangedSubview(subtitleLabel)
        self.addArrangedSubview(colonLabel)
        self.addArrangedSubview(dataLabel)
    }
    
    func addConstraints(for label: UILabel) {
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
