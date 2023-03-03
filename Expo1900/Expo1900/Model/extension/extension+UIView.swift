//
//  extension+UIView.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/27.
//

import UIKit

extension UIView {
    func setAutoLayout(equalTo view: UIView,
                       isNeededWidthAnchor: Bool,
                       leadingConstant: CGFloat = 0,
                       trailingConstant: CGFloat = 0,
                       topConstant: CGFloat = 0,
                       bottomConstant: CGFloat = 0,
                       widthConstant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstant),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstant),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant),
        ])
        
        if isNeededWidthAnchor == true {
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: widthConstant)
            ])
        }
    }
}
