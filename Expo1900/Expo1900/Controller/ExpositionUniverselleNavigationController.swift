//
//  ExpositionUniverselleNavigationController.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/07/06.
//

import UIKit

class ExpositionUniverselleNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let supportedInterfaceOrientations = self.topViewController?.supportedInterfaceOrientations {
            return supportedInterfaceOrientations
        }
        
        return self.supportedInterfaceOrientations
    }
}
