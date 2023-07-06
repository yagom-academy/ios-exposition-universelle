//
//  ContainerViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/06.
//

import UIKit

class ContainerViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController!.supportedInterfaceOrientations
    }
}
