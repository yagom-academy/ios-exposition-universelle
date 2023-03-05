//
//  extension+UIImage.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/23.
//

import UIKit

extension UIImage {
    
    func resizeHeightByWidth(width: CGFloat = 65) -> CGFloat {
        let originWidth: CGFloat = self.size.width
        let originHeight: CGFloat = self.size.height
        
        let sizeRatio = width / originWidth
        let resizedHeight = originHeight * sizeRatio
        return resizedHeight
    }
}
