//
//  TableViewController.swift
//  Expo1900
//
//  Created by 사파리, 파프리 on 2022/04/14.
//

import UIKit

final class ItemTableViewController: UITableViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    let itemsList: [Heritage]? = [Heritage].parsingJson(name: "items")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let elementCount = itemsList?.count else { return 0 }
        
        return elementCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        var content = itemCell.defaultContentConfiguration()
        
        content.text = itemsList?[indexPath.row].title
        content.secondaryText = itemsList?[indexPath.row].shortDescription
        content.image = UIImage(named: itemsList?[indexPath.row].imageName ?? "swift")
        itemCell.contentConfiguration = content
        
        return itemCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let subView = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailVC") as? ItemDetailViewController else { return }
        
        subView.item = itemsList?[indexPath.row]
        
        self.navigationController?.pushViewController(subView, animated: true)
    }
}
