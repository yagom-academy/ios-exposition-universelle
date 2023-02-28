//
//  ExpoNavigationController.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/28.
//

import UIKit

class ExpoNavigationController: UINavigationController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let _ = self.topViewController as? MainPosterViewController else { return .all }
        
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
