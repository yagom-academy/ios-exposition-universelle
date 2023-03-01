//
//  EntryTableViewController.swift
//  Expo1900
//
//  Created by 혜모리, Andrew on 2023/02/23.
//

import UIKit

final class EntryTableViewController: UITableViewController {
    private var entryList: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeEntryInfo()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        navigationItem.title = "한국의 출품작"
    }
    
    private func decodeEntryInfo() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            entryList = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Table view data source
extension EntryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                       for: indexPath) as? CustomTableViewCell
        else { fatalError("Failed to load a CustomTableViewCell from the table.") }
        let entry: Entry = entryList[indexPath.row]
        
        cell.configureEntryList(image: entry.imageName,
                                name: entry.name,
                                shortDescription: entry.shortDescription)
        tableView.rowHeight = UITableView.automaticDimension
        return cell
    }
    
}

// MARK: - Table view delegate
extension EntryTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entryInfoViewController = EntryInfoViewController(entry: entryList[indexPath.row])
        navigationController?.pushViewController(entryInfoViewController, animated: true)
    }
}
