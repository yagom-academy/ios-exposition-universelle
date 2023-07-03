//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/28.
//

import UIKit

final class EntryListViewController: UIViewController {
    @IBOutlet private weak var entryTableView: UITableView!
    
    private var entryData: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.entryTableView.delegate = self
        self.entryTableView.dataSource = self
        navigationItem.title = "한국의 출품작"
        unwrapData()
    }

    private func unwrapData() {
        do {
            entryData = try [Entry].decode(file: "items")
        } catch {
            print(error.localizedDescription)
        }
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
        guard let entryDetailViewController = self.storyboard?.instantiateViewController(identifier: "detailEntryViewController", creator: { coder in DetailEntryViewController(coder: coder, data: self.entryData[indexPath.row]) }) else {
            return
        }
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
