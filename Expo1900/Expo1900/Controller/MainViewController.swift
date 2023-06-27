//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpGoToEntryListButton(_ sender: UIButton) {
        let storyboardName = "Main"
        let storyboardId = "EntryListViewController"

        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)

        self.navigationItem.backBarButtonItem = createMainBackBarButtonItem()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func createMainBackBarButtonItem() -> UIBarButtonItem {
        let backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil)
        
        return backBarButtonItem
    }
}

