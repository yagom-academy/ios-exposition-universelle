//
//  ExpositionNavigationController.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/28.
//

import UIKit

class ExpositionNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let _ = self.topViewController as? ParisExpositionUniverselleViewController else {
            return .all
        }
        
        return .portrait
    }
}
