//
//  NavigationViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/21.
//

import UIKit

class ExpoNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let _ = self.topViewController as? MainViewController else {
            return .all
        }
        return .portrait
    }

}
