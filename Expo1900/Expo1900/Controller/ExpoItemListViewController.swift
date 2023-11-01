//
//  ExpoItemListViewController.swift
//  Expo1900
//
//  Created by Kiseok on 2023/11/01.
//

import UIKit

class ExpoItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

}
