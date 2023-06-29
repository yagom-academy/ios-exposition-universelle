//
//  UIImageView+.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/29.
//

import UIKit

extension UIImageView {
    func insertImage(name: String?) -> UIImage? {
        guard let imageName = name else {
            return nil
        }
        
        return UIImage(named: imageName)
    }
}
