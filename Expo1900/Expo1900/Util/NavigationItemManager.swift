//
//  NavigationItemManager.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/18.
//

import UIKit

extension UIViewController {
    func modifyNavigationBackButtonTitle(to name: String, in viewController: UIViewController) {
        viewController.navigationController?.navigationBar.topItem?.backButtonTitle = name
    }
    
    func modifyNavigationTitle(to name: String, in viewController: UIViewController) {
        viewController.title = name
    }
}
