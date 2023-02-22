//
//  ItemEntryViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class ItemEntryViewController: UITableViewController {
    private var items: [Item] = []
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        decodeItemsData()
    }
    
    private func decodeItemsData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.items = try jsonDecoder.decode([Item].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].shortDescription
        cell.imageView?.image = UIImage(named: items[indexPath.row].imageName)
        return cell
    }
}
