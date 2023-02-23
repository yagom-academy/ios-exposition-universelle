//
//  EntryTableViewController.swift
//  Expo1900
//
//  Created by Andrew on 2023/02/23.
//

import UIKit

final class EntryTableViewController: UITableViewController {
    private var entryList: [Entry] = []
    private let cellIdentifier: String = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeEntryInfo()
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func decodeEntryInfo() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.entryList = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomTableViewCell else { fatalError("Failed to load a CustomTableViewCell from the table.") }
        let entry: Entry = self.entryList[indexPath.row]
        
        cell.configureEntryList(image: entry.imageName, name: entry.name, shortDescription: entry.shortDescription)

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
