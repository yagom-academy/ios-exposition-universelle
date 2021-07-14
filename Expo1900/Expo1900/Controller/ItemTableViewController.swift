//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/12.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    //MARK: - Property
    var item: Entry?

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = item?.name
    }
    
    //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        if let item = item {
        cell.itemImageView.image = UIImage(named: item.imageName)
            cell.itemDescrption.text = item.description
        }
        return cell
    }
}
