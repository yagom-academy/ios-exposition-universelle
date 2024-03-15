//
//  EntriesTableViewController.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/8/24.
//

import UIKit

final class EntriesTableViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private var entryDTOs: [EntryDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeEntryItems()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func decodeEntryItems() {
        guard let entryDTOs = JSONDecoder().decode(from: "items", to: [EntryDTO].self) else { return }
        
        self.entryDTOs = entryDTOs
    }
}

extension EntriesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entryDetail = entryDTOs[indexPath.row].toEntryDetail()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let entryDetailViewController = storyboard.instantiateViewController(identifier: "EntryDetailViewController") { creater in
            return EntryDetailViewController(coder: creater, entryDetail: entryDetail)
        }
        
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension EntriesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryDTOs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = entryDTOs[indexPath.row].toEntry()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryTableViewCell") as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateComponents(with: entry)
        
        return cell
    }
}
