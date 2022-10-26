//
//  NavigationController.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/26.
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
