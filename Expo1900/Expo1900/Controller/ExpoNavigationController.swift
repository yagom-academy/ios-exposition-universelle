//
//  ExpoNaviation.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/23.
//

import UIKit

final class ExpoNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard self.topViewController is ExpoMainViewController else {
            return .all
        }
        return .portrait
    }
}
