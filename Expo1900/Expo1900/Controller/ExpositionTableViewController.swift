//
//  ExpositionTableViewController.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/15.
//

import UIKit

final class ExpositionTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
