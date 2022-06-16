//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

class ItemTableViewController: UITableViewController {

    let entryInfo: [Entry]? = JSONDecoder.decodeJson(jsonName: "items")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "entryCell")
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryInfo = entryInfo else { return 0 }

        return entryInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell",for: indexPath)
        return cell
    }
}
