//
//  OrientedNavigationViewController.swift
//  Expo1900
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

final class OrientedNavigationViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let _ = topViewController as? ExpositionPosterViewController else {
            return .all
        }
        
        return .portrait
    }
}
