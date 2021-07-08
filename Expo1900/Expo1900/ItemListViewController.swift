//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by yun on 2021/07/08.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var itemList: [KoreanItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
        itemList = try jsonDecoder.decode([KoreanItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

    }
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListCell", for: indexPath) as? ItemListCell else {
            return UITableViewCell()
        }
        let item = itemList[indexPath.row]
        cell.itemName.text = item.itemName
        cell.itemImage.image = UIImage(named: item.imageName)
        cell.shortDescription.text = item.shortDescription
        
        return cell
    }
}
