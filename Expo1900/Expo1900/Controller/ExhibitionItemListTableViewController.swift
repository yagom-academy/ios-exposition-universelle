//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExhibitionItemListTableViewController: UIViewController {
    
    var exhibitionItems: [ExhibitionItem] = []
    
    @IBOutlet var exhibitionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exhibitionTableView.dataSource = self
        
        let jsonDecoder = JSONDecoder()
        guard let data = NSDataAsset(name: "items") else {
            return
        }
        do {
            exhibitionItems = try jsonDecoder.decode([ExhibitionItem].self, from: data.data)
        } catch {
            print(error)
        }
    }
}

extension ExhibitionItemListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exhibitionItemCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: exhibitionItems[indexPath.row].imageName)
        content.text = exhibitionItems[indexPath.row].name
        content.secondaryText = exhibitionItems[indexPath.row].shortDescription
        
        content.imageProperties.maximumSize = CGSize(width: 70, height: 150)
        cell.contentConfiguration = content
        
        return cell
    }
}
