//
//  ContainerViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/23.
//

import UIKit

class ContainerViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard self.topViewController is MainViewController else {
            return .all
        }
        return .portrait
    }
    
}
