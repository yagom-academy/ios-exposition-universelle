//
//  ItemsViewController.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/09.
//

import UIKit

var items: [Item] = []
var itemData: Item = Item(name: "", imageName: "", shortDesc: "", desc: "")

class ItemsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        jsonPaser()
        
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func jsonPaser() {
        let jsonDecoder = JSONDecoder()
        guard let itemsData: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            items = try jsonDecoder.decode([Item].self, from: itemsData.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemData = items[indexPath.row]
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCustomCell", for: indexPath) as? ItemsCustomCell else {
            return UITableViewCell()
        }
        
        cell.itemImageView.image = UIImage(named: items[indexPath.row].imageName)
        cell.nameLabel.text = items[indexPath.row].name
        cell.shortDescLabel.text = items[indexPath.row].shortDesc
        
        return cell
    }
}
