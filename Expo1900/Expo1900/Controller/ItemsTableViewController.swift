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
    private let navigationTitle: String
    
    init?(navigationTitle: String, coder: NSCoder) {
        self.navigationTitle = navigationTitle
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        decodeJSONToItems()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = navigationTitle
        navigationItem.backBarButtonItem = UIBarButtonItem(title: navigationTitle, style: .plain, target: .none, action: .none)
    }
    
    private func decodeJSONToItems() {
        do {
            items = try AssetDecoder.decode([Item].self, from: AssetName.items)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ItemsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemTableViewCell.id,
            for: indexPath
        ) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        
        cell.configure(item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nextViewController = storyboard?.instantiateViewController(
            identifier: ItemDetailViewController.id,
            creator: { coder in
                return ItemDetailViewController(item: self.items[indexPath.row], coder: coder)
            }
        ) {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
