//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/27.
//

import UIKit

final class EntryListViewController: UIViewController {
    private var entryList: [Entry]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeEntryList()
    }
    
    private func decodeEntryList() {
        let dataAssetName = "items"
        
        do {
            entryList = try Decoder.decodeJSON(dataAssetName)
        } catch {
            print(error)
        }
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "entryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        guard let entryCell = cell as? EntryTableViewCell else {
            return cell
        }
        
        if let entryList {
            entryCell.titleLabel.text = entryList[indexPath.row].name
            entryCell.shortDescriptionLabel.text = entryList[indexPath.row].shortDescription
            entryCell.entryImageView.image = UIImage(named: entryList[indexPath.row].imageName)
        }
        
        return cell
    }
}
