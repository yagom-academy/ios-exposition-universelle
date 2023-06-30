//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/28.
//

import UIKit

class EntryListViewController: UIViewController {
    @IBOutlet weak var entryTableView: UITableView!
    var entryData: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "한국의 출품작"
        
        self.entryTableView.delegate = self
        self.entryTableView.dataSource = self
        unwrapData()
    }

    func unwrapData() {
        do {
            entryData = try JSONDecoder().decode([Entry].self, from: "items")
        } catch {}
    }
}

extension EntryListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.insertCellData(from: entryData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController = self.storyboard?.instantiateViewController(identifier: "entryDetailViewController", creator: { coder in
            EntryDetailViewController(coder: coder, data: self.entryData[indexPath.row]) }) else { return }
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
