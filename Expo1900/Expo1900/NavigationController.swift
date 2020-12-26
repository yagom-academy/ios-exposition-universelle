//
//  NavgationController.swift
//  Expo1900
//
//  Created by 임리나 on 2020/12/27.
//

import UIKit

class Navigationcontroller: UINavigationController {
    
    override var shouldAutorotate: Bool {
        if let isRatating = self.topViewController?.shouldAutorotate {
            return isRatating
        } else {
            return true
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.all]
    }
}

