//
//  UIImage+.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import UIKit

extension UIImage {
    func resized(height: CGFloat) -> UIImage {
        let ratio = self.size.width / self.size.height
        let newWidth = height * ratio
        let size = CGSize(width: newWidth, height: height)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        
        return image
    }
}
