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
        exhibitionTableView.delegate = self
        
        let jsonDecoder = JSONDecoder()
        guard let data = NSDataAsset(name: String(describing: JsonFileName.items)) else {
            return
        }
        do {
            exhibitionItems = try jsonDecoder.decode([ExhibitionItem].self, from: data.data)
        } catch {
            print(error)
        }
    }
}

// MARK:- UITableViewDataSource
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

// MARK:- UITableViewDelegate
extension ExhibitionItemListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? ExhibitionItemDetailViewController else {
            return
        }
        
        detailViewController.configure(exhibitionItems[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
