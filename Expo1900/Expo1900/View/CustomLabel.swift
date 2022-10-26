//
//  TitleLabel.swift
//  Expo1900
//
//  Created by Ayaan on 2022/10/27.
//

import UIKit

final class TitleLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUpAccessibility(fontStyle: .title1)
        self.textAlignment = .center
    }
}

final class BodyLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUpAccessibility(fontStyle: .body)
        self.textAlignment = .center
    }
}

final class DescriptionLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUpAccessibility(fontStyle: .body)
        self.textAlignment = .left
    }
}
