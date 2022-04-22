//
//  LockOrientation.swift
//  Expo1900
//
//  Created by Lingo on 2022/04/21.
//

import UIKit

fileprivate extension Constants {
  static let orientation = "orientation"
}

protocol Orientating {
  func setOrientationLock(
    _ orientation: UIInterfaceOrientationMask
  )
  
  func lockOrientation(
    _ orientation: UIInterfaceOrientationMask,
    andRotateTo rotateOrientation: UIInterfaceOrientation
  )
}

extension Orientating {
  func setOrientationLock(
    _ orientation: UIInterfaceOrientationMask
  ) {
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
      delegate.setOrientationLock(orientation)
    }
  }
  
  func lockOrientation(
    _ orientation: UIInterfaceOrientationMask,
    andRotateTo rotateOrientation: UIInterfaceOrientation
  ) {
    self.setOrientationLock(orientation)
    UIDevice.current.setValue(rotateOrientation.rawValue, forKey: Constants.orientation)
  }
}
