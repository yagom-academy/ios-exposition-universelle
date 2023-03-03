//
//  extension+UINavigationController.swift
//  Expo1900
//
//  Created by 김성준 on 2023/03/01.
//

import UIKit

extension UINavigationController {
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let _ = self.topViewController as? PosterViewController else {
            return .all
        }
        
        return .portrait
    }
}
