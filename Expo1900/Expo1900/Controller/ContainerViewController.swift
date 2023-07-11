//
//  ContainerViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/06.
//

import UIKit

final class ContainerViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let supportedInterfaceOrientations = self.topViewController?.supportedInterfaceOrientations else {
            return self.supportedInterfaceOrientations
        }
        
        return supportedInterfaceOrientations
    }
}
