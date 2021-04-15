//
//  ExpoListViewController.swift
//  Expo1900
//
//  Created by TORI on 2021/04/14.
//

import UIKit

class ExpoListViewController: UITableViewController {
    
    var itemList = [ExpoItem]()
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
            self.navigationItem.title = "한국의 출품작"
            decodeExpoItem()
        }
    
    func decodeExpoItem() {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "items") else {
            return
        }
        let data = dataAsset.data
        
        do {
            let result = try decoder.decode([ExpoItem].self, from: data)
            itemList = result
        } catch {
            print("parsing failed")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "ListCell")
        let item = itemList[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        cell.imageView?.image = UIImage(named: item.imageName)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.shortDescription
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expoListDetailViewController = ExpoListDetailViewController()
        let item = itemList[indexPath.row]
        
        expoListDetailViewController.itemTitle = item.name
        expoListDetailViewController.imageName = item.imageName
        expoListDetailViewController.descriptionText = item.description
        
        navigationController?.pushViewController(expoListDetailViewController, animated: true)
    }
}
