//
//  NavgationController.swift
//  Expo1900
//
//  Created by 임리나 on 2020/12/27.
//

import UIKit

final class NavigationController: UINavigationController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let orientation = self.topViewController?.supportedInterfaceOrientations {
            return orientation
        }
        return [.all]
    }
}

