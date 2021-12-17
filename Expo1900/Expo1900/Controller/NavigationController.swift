//
//  NavigationController.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/14.
//

import UIKit

class NavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? .all
    }
}
