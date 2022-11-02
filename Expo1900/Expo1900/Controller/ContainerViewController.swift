//
//  ContainerViewController.swift
//  Expo1900
//

import UIKit

class ContainerViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController!.supportedInterfaceOrientations
    }
}
