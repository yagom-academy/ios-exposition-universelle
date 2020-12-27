//
//  ContainerViewController.swift
//  Expo1900
//
//  Created by 김동빈 on 2020/12/27.
//

import UIKit

class ContainerViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? [.all]
        }
}
