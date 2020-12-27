//
//  ContainerViewController.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/25.
//

import Foundation
import UIKit

class ContainerViewController: UINavigationController {
    override var shouldAutorotate: Bool {
        return self.topViewController?.shouldAutorotate ?? true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? [.all]
    }
}
