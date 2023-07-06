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
        return label
    }()

    let dataLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
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
    }
    
    func addArrangedSubviews() {
        self.addArrangedSubview(subtitleLabel)
        self.addArrangedSubview(dataLabel)
    }
}
