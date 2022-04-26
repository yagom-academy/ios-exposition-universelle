//
//  NavigationViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/21.
//

import UIKit

final class ExpoNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard self.topViewController is MainViewController else {
            return .all
        }
        return .portrait
    }
}
