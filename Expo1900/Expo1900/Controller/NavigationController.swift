//
//  NavigationController.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/14.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        switch self.topViewController {
        case is ExpositionViewController:
            return .portrait
        default:
            return .all
        }
    }
}
