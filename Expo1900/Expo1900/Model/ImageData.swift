//
//  ImageData.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

struct ImageData {
    static func load(from fileName: String?) -> UIImage? {
        guard let fileName = fileName else {
            return nil
        }

        return UIImage(named: fileName)
    }
}
    
