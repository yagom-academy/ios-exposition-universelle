//  Expo1900 - CustomLabel.swift
//  Created by Ayaan, Bella on 2022/10/27.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class TitleLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setUpDynamicType(fontStyle: .title1)
        self.textAlignment = .center
    }
}

final class BodyLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setUpDynamicType(fontStyle: .body)
        self.textAlignment = .center
    }
}

final class DescriptionLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setUpDynamicType(fontStyle: .body)
        self.textAlignment = .left
    }
}
