//
//  ContainerViewController.swift
//  Expo1900
//
//  Created by Eddy on 2022/04/22.
//

import UIKit

final class ContainerViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let worldFairPosterViewController = self.topViewController as? WorldFairPosterViewController else {
            return .all
        }
        return .portrait
    }
}
