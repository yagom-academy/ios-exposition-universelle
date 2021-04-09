//
//  ExhibiedItemsViewController.swift
//  Expo1900
//
//  Created by seunkim on 2021/04/09.
//

import UIKit

class ExhibitedItemsViewController: UIViewController {
    
    var items: [ExhibitedItem] = []
    
    @IBOutlet weak var exhibitedItemsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exhibitedItemsTable.delegate = self
        exhibitedItemsTable.dataSource = self
        
        let nibName = UINib(nibName: "ItemTableViewCell", bundle: nil)
        exhibitedItemsTable.register(nibName, forCellReuseIdentifier: "itemCell")
        
        parseExhibitedItems()
    }
    
    private func parseExhibitedItems() {
        let jsonDecoder = JSONDecoder()
        
        guard let itemJsonData = NSDataAsset(name: "items") else { return }
        
        guard let items = try? jsonDecoder.decode([ExhibitedItem].self, from: itemJsonData.data) else { return }
        
        self.items = items
    }
}

extension ExhibitedItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath, " tap!!")
    }
}

extension ExhibitedItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        
        cell.itemTitle.text = items[indexPath.row].name
        cell.itemImage.image = UIImage(named: items[indexPath.row].imageName)
        cell.itemShortDescription.text = items[indexPath.row].shortDescription
        
        return cell
    }
}
