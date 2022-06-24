//
//  MainNavigationController.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/24.
//

import UIKit

final class MainNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let orientation = self.topViewController?.supportedInterfaceOrientations else { return .all }
        return orientation
    }
    
}
