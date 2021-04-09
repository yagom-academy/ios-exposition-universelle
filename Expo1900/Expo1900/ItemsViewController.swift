//
//  ItemsViewController.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/09.
//

import UIKit

class ItemsViewController: UIViewController {
    var items: [Item] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let jsonDecoder = JSONDecoder()
        guard let itemsData: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.items = try jsonDecoder.decode([Item].self, from: itemsData.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
}

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.description + "을 만졌어!!")
    }
}

extension ItemsViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 10
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCustomCell", for: indexPath) as! ItemsCustomCell
        
        cell.itemImageView.image = UIImage(named: items[indexPath.row].imageName)
        cell.nameLabel.text = items[indexPath.row].name
        cell.shortDescLabel.text = items[indexPath.row].shortDesc
        
        return cell
    }
}
