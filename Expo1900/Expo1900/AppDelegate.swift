//
//  Expo1900 - AppDelegate.swift
//  Created by Lingo, Mino
// 

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  private var orientationLock = UIInterfaceOrientationMask.all
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    return UISceneConfiguration(
      name: "Default Configuration",
      sessionRole: connectingSceneSession.role
    )
  }
  
  // MARK: Set Orientation
  
  func application(
    _ application: UIApplication,
    supportedInterfaceOrientationsFor window: UIWindow?
  ) -> UIInterfaceOrientationMask {
    return self.orientationLock
  }
  
  func setOrientationLock(_ orientation: UIInterfaceOrientationMask) {
    self.orientationLock = orientation
  }
}
