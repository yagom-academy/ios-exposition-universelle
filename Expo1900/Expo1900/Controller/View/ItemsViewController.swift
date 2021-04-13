//
//  ItemsViewController.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/09.
//

import UIKit

var itemData: KoreaItems = KoreaItems(name: "", imageName: "", shortDesc: "", description: "")

class ItemsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var items: [KoreaItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let itemsData = CustomJsonDecoder.jsonFileDecode(fileName: "items", model: [KoreaItems].self)
        switch itemsData {
        case .success(let result):
            items = result
        case .failure(let error):
            print(error.rawValue)
        }
        
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

    
}

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let itemDetailViewController = self.storyboard?.instantiateViewController(identifier: "itemDetailView") as? ItemDetailViewController else {
                    return
                }
        itemDetailViewController.itemData = items[indexPath.row]
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
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
       
        cell.configureCell(data: items[indexPath.row])
        
        return cell
    }
    
}
