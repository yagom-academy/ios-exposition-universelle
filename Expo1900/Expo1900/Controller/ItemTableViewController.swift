//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

final class ItemTableViewController: UITableViewController {

    private let entryInfo: [Entry]? = JSONDecoder.decodeJson(jsonName: "items")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "entryCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryInfo = entryInfo else { return 0 }
        return entryInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let entryInfo = entryInfo else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell",for: indexPath) as! ItemTableViewCell
        cell.updateEntry(by: entryInfo[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDescriptionViewController = ItemDescriptionViewController()
        itemDescriptionViewController.entryInfo = self.entryInfo?[indexPath.row]
        navigationController?.pushViewController(itemDescriptionViewController, animated: true)
    }
    
    private func setNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backItem?.title = "메인"
        title = "한국의 출품작"
    }
}
