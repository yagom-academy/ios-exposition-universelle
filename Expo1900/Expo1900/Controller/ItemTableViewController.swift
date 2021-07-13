//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/12.
//

import Foundation
import UIKit

class ItemTableViewController: UITableViewController {
    
    //MARK: - Property
    var itemName: String?
    var itemImage: UIImage?
    var itemDescription: String?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = itemName
    }
    
    //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.itemImageView.image = itemImage
        cell.itemDescrption.text = itemDescription
        return cell
    }
}
