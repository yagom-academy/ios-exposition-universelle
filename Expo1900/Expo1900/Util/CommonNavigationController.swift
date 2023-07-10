//
//  CommonNavigationController.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/07/06.
//

import UIKit

final class CommonNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let orientation = topViewController?.supportedInterfaceOrientations else {
            return self.supportedInterfaceOrientations
        }
        
        return orientation
    }
}
