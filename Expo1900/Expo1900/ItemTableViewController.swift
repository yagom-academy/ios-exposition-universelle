//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/16.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    let itemDataManager = ItemDataManager()
    var items: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specifyNavigationBarSetting()
        generateItems()
        specifyTableViewSetting()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item = items?[indexPath.row]
        cell.updateData(from: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        let item = items?[indexPath.row]
        detailViewController.updateData(from: item)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func specifyNavigationBarSetting() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "한국의 출품작"
    }
    
    private func generateItems() {
        items = itemDataManager.fetchData()
    }
    
    private func specifyTableViewSetting() {
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }
}
