//
//  AppUtility.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/21.
//

import Foundation
import UIKit

struct AppUtility {
    
    static func lockOrientation( orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    static func lockOrientation( orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation: orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
}
