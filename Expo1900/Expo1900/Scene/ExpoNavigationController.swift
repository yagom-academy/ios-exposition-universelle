//
//  ExpoNavigationController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/19.
//

import UIKit

class ExpoNavigationController: UINavigationController {
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if self.topViewController as? ExpoViewController == nil {
      return .all
    } else {
      return .portrait
    }
  }
}
