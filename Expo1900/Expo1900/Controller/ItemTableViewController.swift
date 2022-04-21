//
//  TableViewController.swift
//  Expo1900
//
//  Created by 사파리, 파프리 on 2022/04/14.
//

import UIKit

final class ItemTableViewController: UITableViewController {
    @IBOutlet weak var itemsTableView: UITableView!
    private let itemsList: [Heritage]? = [Heritage].parsingJson(name: "items")
    private let cellIdentifier = "itemCell"
    private let subViewVCIdentifier = "ItemDetailVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - Table view data source
extension ItemTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        itemCell.itemTitleLebel.text = itemsList?[indexPath.row].title
        itemCell.itemImageView.image = UIImage(named: itemsList?[indexPath.row].imageName ?? "swift")
        itemCell.itemShortDescriptionLabel.text = itemsList?[indexPath.row].shortDescription
        
        return itemCell
    }
}

// MARK: - Table view delegate
extension ItemTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = itemsList?[indexPath.row] else { return }
        guard let subViewController = self.storyboard?.instantiateViewController(identifier: subViewVCIdentifier, creator: { coder in ItemDetailViewController(item: item, coder: coder) }) else { return }
        
        self.navigationController?.pushViewController(subViewController, animated: true)
    }
}
