//
//  ExpositionNavigationController.swift
//  Expo1900
//
//  Created by hy on 2022/10/27.
//

import UIKit

class ExpositionNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if self.topViewController is MainViewController {
            return [.portrait]
        } else {
            return [.all]
        }
    }
}
