//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

class KoreanEntryTableViewController: UITableViewController {
    private var dataSource: EntryDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = EntryDataSource()
        tableView.dataSource = dataSource
    }
}
