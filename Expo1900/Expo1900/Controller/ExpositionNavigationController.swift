//  Expo1900 - ExpositionNavigationController.swift
//  Created by Ayaan, Bella on 2022/10/27.
//  Copyright © yagom academy. All rights reserved.

import UIKit

class ExpositionNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let `topViewController` = self.topViewController else {
            return .all
        }
        
        return `topViewController`.supportedInterfaceOrientations
    }
}
