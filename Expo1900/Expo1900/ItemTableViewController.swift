//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/16.
//

import UIKit

class ItemTableViewController: UITableViewController {
    let itemDataManager = ItemDataManager()
    var itemModel: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "한국의 출품작"
        result = itemDataManager.getData()
        
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModel?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        if let result = result {
            cell.nameLabel.text = "\(String(describing: result[indexPath.row].name))"
            cell.shortDescriptionLabel.text = "\(String(describing: result[indexPath.row].shortDescription))"
            cell.itemImageView.image = UIImage(named: result[indexPath.row].imageName )
            cell.accessoryType = .disclosureIndicator
        }
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let result = result {
            detailViewController.itemTitle = result[indexPath.row].name
            detailViewController.itemImageView.image = UIImage(named: result[indexPath.row].imageName)
            detailViewController.descriptionLabel.text = result[indexPath.row].description
        }
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
