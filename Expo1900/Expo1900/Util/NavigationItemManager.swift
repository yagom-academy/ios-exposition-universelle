//
//  NavigationItemManager.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/18.
//

import UIKit

func modifyNavigationBackButtonTitle(to name: String, in VC: UIViewController) {
    VC.navigationController?.navigationBar.topItem?.backButtonTitle = name
}

func modifyNavigationTitle(to name: String, in VC: UIViewController) {
    VC.title = name
}
