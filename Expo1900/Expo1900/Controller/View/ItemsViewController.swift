//
//  ItemsViewController.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/09.
//

import UIKit

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let itemDetailViewController = segue.destination as? ItemDetailViewController
            guard let testIndexPath = tableView.indexPathForSelectedRow else { return }
            
            itemDetailViewController?.receiveDetailData(data: items[testIndexPath.row])
            
        }
    }
}

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
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
