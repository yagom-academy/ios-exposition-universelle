//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/07/07.
//

import UIKit

class ItemListViewController: UIViewController {
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initItems()
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.transfer(data: items[indexPath.row])
        return cell
    }
}

extension ItemListViewController: JSONDecodable {
    typealias JSONModel = [Item]
    
    func initItems() {
        items = try! decodeJSON(fileName: .itemsFileName)
    }
}
