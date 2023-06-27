//
//  ItemsTableViewController.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/27.
//

import UIKit

final class ItemsTableViewController: UITableViewController {
    static let id = "itemsTableViewControllerID"
    private var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeJSONToItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: ItemsTableViewCell.id, for: indexPath) as? ItemsTableViewCell else { fatalError() }
        
        return cell
    }
    
    private func decodeJSONToItems() {
        guard let json = NSDataAsset(name: "items") else { return }
        let decoder = JSONDecoder()
        
        do {
            items = try decoder.decode([Item].self, from: json.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
