//
//  extension+UIImage.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/23.
//

import UIKit

extension UIImage {
    
    func squareImage(length: CGFloat = 65) -> UIImage? {
        let originWidth: CGFloat = self.size.width
        let originHeight: CGFloat = self.size.height
        var resizedWidth: CGFloat = length
        var resizedHeight: CGFloat = length
        
        UIGraphicsBeginImageContext(CGSize(width: length, height: length))
        UIColor.clear.set()
        UIRectFill(CGRect(x: 0.0, y: 0.0, width: length, height: length))
        
        let sizeRatio = length / max(originWidth, originHeight)
        if originWidth > originHeight {
            resizedWidth = length
            resizedHeight = originHeight * sizeRatio
        } else {
            resizedWidth = originWidth * sizeRatio
            resizedHeight = length
        }
        
        self.draw(in: CGRect(x: length / 2 - resizedWidth / 2,
                             y: length / 2 - resizedHeight / 2,
                             width: resizedWidth,
                             height: resizedHeight))
        
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    func resizeHeightByWidth(width: CGFloat = 65) -> CGFloat {
        let originWidth: CGFloat = self.size.width
        let originHeight: CGFloat = self.size.height
        
        
        let sizeRatio = width / originWidth
        let resizedHeight = originHeight * sizeRatio
        return resizedHeight
    }
}
