//
//  ExpoNavigationController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/19.
//

import UIKit

class ExpoNavigationController: UINavigationController {
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    attribute()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if self.topViewController as? ExpoViewController == nil {
      return .all
    } else {
      return .portrait
    }
  }
  
  private func attribute() {
    let navigationAppearance = UINavigationBarAppearance()
    navigationAppearance.configureWithDefaultBackground()
    navigationBar.standardAppearance = navigationAppearance
    navigationBar.compactAppearance = navigationAppearance
    navigationBar.scrollEdgeAppearance = navigationAppearance
  }
}
