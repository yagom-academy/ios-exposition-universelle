//
//  ExpositionImageView.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/13.
//

import UIKit

final class ExpositionImageView: UIImageView {
    
    init(imageName: String) {
        let image = UIImage(named: imageName) ?? UIImage(systemName: "zzz")
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
