//
//  OrientationMask.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/15.
//

import Foundation
import UIKit

protocol OrientaionMakeable {
    static var shared: OrientaionMake { get set }
    func judgedOrientaionMake(_ isPortrait: Bool)
    func isOrientaionMake() -> Bool
}

final class OrientaionMake: OrientaionMakeable {
    static var shared = OrientaionMake()
    private var shouldSupportAllOrientation = true
    
    private init() { }
    
    func judgedOrientaionMake(_ isPortrait: Bool) {
        if isPortrait == true {
            shouldSupportAllOrientation = true
        } else {
            shouldSupportAllOrientation = false
        }
    }
    
    func isOrientaionMake() -> Bool {
        return shouldSupportAllOrientation
    }
}
