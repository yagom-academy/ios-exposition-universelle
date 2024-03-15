//
//  TableViewController.swift
//  Expo1900
//
//  Created by H on 3/12/24.
//

import UIKit

class TableViewController: UITableViewController {

    var list: [Item] = []
    
    @IBOutlet var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        configureTableView()
    }
    
    private func loadItems() {
        guard let asset = NSDataAsset.init(name: "items") else {
            return
        }
        
        let decoder = JSONDecoder()
        
        do {
            list = try decoder.decode([Item].self, from: asset.data)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }
    
    private func configureTableView() {
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.estimatedRowHeight = 100
        itemsTableView.rowHeight = UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = itemsTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? TableViewCell else {
            fatalError("Error: 'itemCell' not found")
        }
        
        let item = list[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listToDetail" {
            if let cell = sender as? UITableViewCell {
                if let indexPath = itemsTableView.indexPath(for: cell){
                    if let vc = segue.destination as? DetailViewController {
                        let item = list[indexPath.row]
                        vc.item = item
                        vc.navigationItem.title = "\(item.name)"
                    }
                }
            }
        }
    }
}
