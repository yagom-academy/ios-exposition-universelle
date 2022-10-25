//
//  EntryTableViewController.swift
//  Expo1900
//
//  Created by baem,woong on 2022/10/19.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var items: [Items]?
    let a = Namespace.customCell
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        items = JSONDecoder.decodeData("items", to: [Items].self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailEntryViewController: DetailEntryViewController = segue.destination as? DetailEntryViewController else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            detailEntryViewController.jsonName = items?[indexPath.row].name
            detailEntryViewController.jsonDesc = items?[indexPath.row].desc
            detailEntryViewController.jsonImageName = items?[indexPath.row].imageName
        }
    }
}

extension EntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Namespace.customCell, for: indexPath) as? EntryTableViewCell else { return UITableViewCell() }
        
        guard let items = items else { return UITableViewCell() }
        
        cell.entryImageView.image = UIImage(named: items[indexPath.row].imageName)
        cell.entryLabel.text = items[indexPath.row].name
        cell.entrySubLabel.text = items[indexPath.row].shortDesc
        
        return cell
    }
}

