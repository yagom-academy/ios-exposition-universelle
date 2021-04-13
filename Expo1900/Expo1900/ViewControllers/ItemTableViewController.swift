//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/10.
//

import UIKit

class ItemTableViewController: UITableViewController {
    var items: [Item] = []
    let cellIdentifier: String = "itemTableCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // 내 자신한테 delegate와 dataSource를 위임 해주는 것
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150

        do {
            try parseItemsData()
            
        } catch {
            
        }

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.itemName.text = items[indexPath.row].name
        cell.itemShortDescription.text = items[indexPath.row].shortDescription
        cell.itemImage.image = UIImage(named: items[indexPath.row].imageName)
        cell.itemDescription = items[indexPath.row].description
        cell.itemImageName = items[indexPath.row].imageName
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }
        
        guard let cell: ItemTableViewCell = sender as? ItemTableViewCell else { return }
        
        nextViewController.itemTitleToSet = cell.itemName.text
        nextViewController.descriptionToSet = cell.itemDescription
        nextViewController.imageToSet = cell.itemImageName
        
    }
    
    func parseItemsData() throws {
        guard let asset = NSDataAsset.init(name: "items") else {
            return
        }
        
        do {
            items = try JSONDecoder().decode([Item].self, from: asset.data)
        } catch {
            throw DataError.InvalidAccess
        }
    }
}


