//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/10.
//

import UIKit

class ItemTableViewController: UITableViewController {
    private var exhibits: [Exhibit] = []
    private let cellIdentifier: String = "itemTableCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        

        do {
            try parseItemsData()
            
        } catch {
            
        }

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        defer { exhibits.removeLast()
//            print("\(exhibits.removeLast()) was removed")
//        }
//        defer { exhibits.append(exhibits[2])
//            print("\(exhibits[2].name) was appended")
//        }
        return exhibits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        guard exhibits.count > indexPath.row else { return UITableViewCell() }
        
        cell.itemName.text = exhibits[indexPath.row].name
        cell.itemShortDescription.text = exhibits[indexPath.row].shortDescription
        cell.itemImage.image = UIImage(named: exhibits[indexPath.row].imageName)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }
        guard let indexPathForSelectedRow = tableView.indexPathForSelectedRow else { return }
        nextViewController.items = exhibits[indexPathForSelectedRow.row]
        print("segue to next page")
    }
    
    func parseItemsData() throws {
        
        guard let asset = NSDataAsset.init(name: "items") else {
            return
        }
        
        do {
            exhibits = try JSONDecoder().decode([Exhibit].self, from: asset.data)
        } catch {
            throw DataError.InvalidAccess
        }
    }
}


