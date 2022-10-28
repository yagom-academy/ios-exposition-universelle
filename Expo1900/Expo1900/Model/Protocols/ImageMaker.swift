//
//  ImageMaker.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/28.
//

import UIKit

protocol ImageMaker { }

extension ImageMaker {
    
    func makeImage(name: String) -> UIImage? {
        return UIImage(named: name)
    }
    
    func downloadImage(url: Data) -> UIImage? {
        return UIImage(data: url)
    }
}
