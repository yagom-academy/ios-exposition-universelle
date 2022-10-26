//
//  NavigationController.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/26.
//

import UIKit

class NavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController as? MainViewController != nil ? .portrait : .all
    }
}
