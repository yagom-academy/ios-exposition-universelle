//
//  ItemViewController.swift
//  Expo1900
//
//  Created by Rhode, Christy on 2023/02/23.
//

import UIKit

class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var exhibitItems: [ExhibitItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let decoder = JSONDecoder()
        guard let items = NSDataAsset(name: "items") else { return }

        guard let decodedItems = try? decoder.decode([ExhibitItem].self, from: items.data) else { return }
        exhibitItems = decodedItems
        
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exhibitItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let exhibitItem: ExhibitItem = self.exhibitItems[indexPath.row]
        
        cell.textLabel?.text = exhibitItem.name
        cell.detailTextLabel?.text = exhibitItem.shortDescription
        cell.imageView?.image = UIImage(named: exhibitItem.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.view.bounds.height / 6
        }
}
