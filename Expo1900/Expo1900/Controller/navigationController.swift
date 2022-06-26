//
//  navigationController.swift
//  Expo1900
//
//  Created by 이예은 on 2022/06/25.
//

import UIKit

class navigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? [.all]
    }
}
