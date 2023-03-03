//
//  NavigationViewController.swift
//  Expo1900
//
//  Created by Seoyeon Hong on 2023/03/03.
//

import UIKit

final class NavigationViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? [.all]
    }
}
