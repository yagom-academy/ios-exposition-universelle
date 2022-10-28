//
//  ExpositionNavigationController.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/26.
//

import UIKit

final class ExpositionNavigationController: UINavigationController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let supportedInterfaceOrientations = self.topViewController?.supportedInterfaceOrientations else {
            return .all
        }
        return supportedInterfaceOrientations
    }
}
