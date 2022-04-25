//
//  NavigationController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

class NavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let _ = self.topViewController as? MainViewController else {
            return .all
        }
        
        return .portrait
    }
}
