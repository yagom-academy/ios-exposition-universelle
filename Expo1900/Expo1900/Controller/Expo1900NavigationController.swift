//
//  Expo1900NavigationController.swift
//  Expo1900
//
//  Created by Dasan & Moo on 2023/07/04.
//

import UIKit

final class Expo1900NavigationController: UINavigationController {
    override var shouldAutorotate: Bool {
        return (self.topViewController?.shouldAutorotate)!
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (self.topViewController?.supportedInterfaceOrientations)!
    }
}
