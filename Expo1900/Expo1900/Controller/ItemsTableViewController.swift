//
//  ItemsTableViewController.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/27.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    static let id = "itemsTableViewControllerID"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
