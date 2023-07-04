//
//  ErrorLabel.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/07/04.
//

import UIKit

class ErrorLabel: UILabel {
    init(_ errorMessage: String, frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = errorMessage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(_ view: UIView) {
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
