//
//  Expo1900NavigationController.swift
//  Expo1900
//
//  Created by Dasan & Moo on 2023/07/04.
//

import UIKit

final class Expo1900NavigationController: UINavigationController {
    override var shouldAutorotate: Bool {
        guard let shouldAutorotate = self.topViewController?.shouldAutorotate else {
            return self.shouldAutorotate
        }
        
        return shouldAutorotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let supportedInterfaceOrientations = self.topViewController?.supportedInterfaceOrientations else {
            return self.supportedInterfaceOrientations
        }
        
        return supportedInterfaceOrientations
    }
}
