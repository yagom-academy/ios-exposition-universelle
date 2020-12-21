//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by Wonhee on 2020/12/22.
//

import UIKit

class KoreaItemsViewController: UIViewController {

    private let koreaItemsViewControllerTitle = "한국의 출품작"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.title = koreaItemsViewControllerTitle
    }
}
