//
//  Expo1900 - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainViewController: ExpositionUniverselleViewController = ExpositionUniverselleViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController : mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

