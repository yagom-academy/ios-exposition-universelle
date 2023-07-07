//
//  Expo1900NavigationController.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/07/04.
//

import UIKit

final class Expo1900NavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let supportedInterfaceOrientations = self.topViewController?.supportedInterfaceOrientations else {
            return self.supportedInterfaceOrientations
        }
        
        return supportedInterfaceOrientations
    }
}
