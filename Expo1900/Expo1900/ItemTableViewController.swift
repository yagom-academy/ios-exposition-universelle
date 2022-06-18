//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/16.
//

import UIKit

class ItemTableViewController: UITableViewController {
    let itemDataManager = ItemDataManager()
    var itemModel: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specifyNavigationBarSetting()
        parseItemModel()
        specifyTableViewSetting()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModel?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        cell.parseData(from: itemModel, with: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.parseData(from: itemModel, with: indexPath)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func specifyNavigationBarSetting() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "한국의 출품작"
    }
    
    private func parseItemModel() {
        itemModel = itemDataManager.fetchData()
    }
    
    private func specifyTableViewSetting() {
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }
}
