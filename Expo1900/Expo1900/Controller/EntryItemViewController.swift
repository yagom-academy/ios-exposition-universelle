//
//  EntryItemViewController.swift
//  Expo1900
//
//  Created by morgan, uemu on 2023/11/02.
//

import UIKit

final class EntryItemViewController: UIViewController {
    
    private var entryItems: [Exposition.EntryItem] = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EntryItemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "entryItemCell", for: indexPath)
        let entryItem: Exposition.EntryItem = entryItems[indexPath.row]
        
        cell.textLabel?.text = entryItem.name
        cell.detailTextLabel?.text = entryItem.shortDesc
        
        return cell
    }
}
