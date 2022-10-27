//
//  ExpoNavigationController.swift
//  Created by sunnyCookie, Wonbi
//

import UIKit

class ExpoNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (topViewController as? ExpoMainViewController) != nil ? .portrait : .all
    }
}
