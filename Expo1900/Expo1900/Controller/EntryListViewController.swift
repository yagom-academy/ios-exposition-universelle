//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/28.
//

import UIKit

class EntryListViewController: UIViewController {
    @IBOutlet weak var entryTableView: UITableView!
    var entryData = [Entry()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "한국의 출품작"
        
        self.entryTableView.delegate = self
        self.entryTableView.dataSource = self
        unwrapData()
    }

    func unwrapData() {
        do {
            entryData = try [Entry].decode(file: "items")
        } catch {}
    }
}

extension EntryListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.fillCells(data: entryData[indexPath.row])
        
        return cell
    }
}
