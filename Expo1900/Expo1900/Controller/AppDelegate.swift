//
//  Expo1900 - AppDelegate.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var shouldSupportAllOrientation = true

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if shouldSupportAllOrientation {
            return .all
        } else {
            return .portrait
        }
    }
}
