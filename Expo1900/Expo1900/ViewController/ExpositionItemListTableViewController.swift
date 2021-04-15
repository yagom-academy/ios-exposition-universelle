//
//  ExpositionListTableViewController.swift
//  Expo1900
//
//  Created by ysp on 2021/04/14.
//

import UIKit

class ExpositionItemListTableViewController: UITableViewController {
    
    var itemsArray: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try decodeExpositionItem()
        } catch {
            print("decodeExpositionItemError")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsArray.count
    }
    
    func decodeExpositionItem() throws {
        self.tableView.dataSource = self
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") else { throw ExpositionItemListError.readFile }
        guard let item = try? jsonDecoder.decode([ExpositionItem].self, from: dataAsset.data) else { throw ExpositionItemListError.decodeData }
        self.itemsArray = item
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        let item: ExpositionItem = self.itemsArray[indexPath.row]
        cell.imageView?.image = UIImage(named: item.imageName)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.shortDescription
        return cell
    }
}
