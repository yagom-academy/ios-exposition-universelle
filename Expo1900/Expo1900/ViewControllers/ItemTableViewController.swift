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
        return exhibits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        guard let exhibit = exhibits[safe: indexPath.row] else { return UITableViewCell() }
        
        cell.exhibitName.text = exhibit.name
        cell.exhibitShortDescription.text = exhibit.shortDescription
        cell.exhibitImage.image = UIImage(named: exhibit.imageName)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }
        guard let indexPathForSelectedRow = tableView.indexPathForSelectedRow else { return }
        nextViewController.exhibit = exhibits[safe: indexPathForSelectedRow.row]
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

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
