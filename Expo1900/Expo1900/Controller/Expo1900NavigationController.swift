//
//  Expo1900NavigationController.swift
//  Expo1900
//
//  Created by 조호준 on 2023/07/04.
//

import UIKit

class Expo1900NavigationController: UINavigationController {
    override var shouldAutorotate: Bool {
        return (self.topViewController?.shouldAutorotate)!
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (self.topViewController?.supportedInterfaceOrientations)!
    }
}
