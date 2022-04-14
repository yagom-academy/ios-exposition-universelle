//
//  Expo1900 - MainViewController.swift
//  Created by Doogie, Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func moveToListViewButton(_ sender: UIButton) {
        guard let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    

}

