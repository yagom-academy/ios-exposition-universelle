//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class KoreaEntriesViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension KoreaEntriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: KoreaEntryDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KoreaEntryDetailTableViewCell") as? KoreaEntryDetailTableViewCell else {
            return KoreaEntryDetailTableViewCell()
        }
        cell.koreaEntryImageView.image = UIImage(named: "god")
        cell.titleLabel.text = "hello"
        cell.shortDescriptionLabel.text = "good"
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}
