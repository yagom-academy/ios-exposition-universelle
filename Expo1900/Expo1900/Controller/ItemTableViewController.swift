//
//  TableViewController.swift
//  Expo1900
//
//  Created by 사파리, 파프리 on 2022/04/14.
//

import UIKit

final class ItemTableViewController: UITableViewController {
    
    private let cellIdentifier = "itemCell"
    private let subViewVCIdentifier = "ItemDetailVC"

    @IBOutlet weak var itemsTableView: UITableView!
    private let itemsList: [Heritage]? = [Heritage].parsingJson(name: "items")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var content = itemCell.defaultContentConfiguration()
        
        content.text = itemsList?[indexPath.row].title
        content.secondaryText = itemsList?[indexPath.row].shortDescription
        content.image = UIImage(named: itemsList?[indexPath.row].imageName ?? "swift")
        itemCell.contentConfiguration = content
        
        return itemCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = itemsList?[indexPath.row] else { return }
        guard let subViewController = self.storyboard?.instantiateViewController(identifier: subViewVCIdentifier, creator: { coder in ItemDetailViewController(item: item, coder: coder) }) else { return }
        
        self.navigationController?.pushViewController(subViewController, animated: true)
    }
}
