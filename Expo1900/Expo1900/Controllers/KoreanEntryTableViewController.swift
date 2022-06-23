//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

final class KoreanEntryTableViewController: UITableViewController, ViewControllerNameIdentifying {
    private var entries: [ExpositionEntry] = []
}

extension KoreanEntryTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEntries()
    }

    private func setupEntries() {
        guard let asset = NSDataAsset.init(name: AssetFileName.items),
              let entries = try? JSONDecoder().decode([ExpositionEntry].self, from: asset.data) else {
            return
        }
        
        self.entries = entries
    }
}

extension KoreanEntryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanEntryTableViewCell.reuseIdentifier, for: indexPath) as? KoreanEntryTableViewCell else {
            return UITableViewCell()
        }
        
        let data = entries[indexPath.row]
        cell.configure(with: data)
        
        return cell
    }
}

extension KoreanEntryTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedEntryViewController = self.storyboard?.instantiateViewController(withIdentifier: SelectedEntryViewController.identifier) as? SelectedEntryViewController else { return }
        selectedEntryViewController.entry = entries[indexPath.row]
        navigationController?.pushViewController(selectedEntryViewController, animated: true)
    }
}
