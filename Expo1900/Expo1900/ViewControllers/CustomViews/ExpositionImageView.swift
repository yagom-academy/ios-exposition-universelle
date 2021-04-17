//
//  ExpositionImageView.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/13.
//

import UIKit

final class ExpositionImageView: UIImageView {
    init() {
        super.init(image: nil)
        setUpExpositionImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpExpositionImageView()
    }
    
    private func setUpExpositionImageView() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        sizeToFit()
    }
}
