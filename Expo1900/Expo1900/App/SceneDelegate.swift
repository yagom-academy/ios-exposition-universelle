//
//  Expo1900 - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = CommonNavigationController()
        
        appCoordinator = AppCoordinator(navigationController)
        setNavigationAppearance()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        appCoordinator?.start()
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    private func setNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .init(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }    
}
