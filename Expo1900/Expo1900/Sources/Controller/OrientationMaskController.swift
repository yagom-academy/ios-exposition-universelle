//
//  OrientationMaskController.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/26.
//

import UIKit

class OrientationMaskController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard topViewController as? InformationViewController != nil else {
            return .all
        }
        
        return .portrait
    }
}
